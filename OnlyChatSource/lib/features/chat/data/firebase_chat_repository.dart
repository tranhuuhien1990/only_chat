import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models.dart';
import 'chat_repository.dart';

class FirebaseChatRepository implements ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseDatabase _rtdb = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<List<ChatRoom>> getChatRooms() {
    final user = _auth.currentUser;
    if (user == null) return Stream.value([]);

    // Lấy danh sách conversations mà người dùng là thành viên từ Firestore
    return _firestore
        .collection('conversations')
        .where('members', arrayContains: user.uid)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return ChatRoom(
          id: doc.id,
          name: data['name'] ?? 'Chat',
          participants: List<String>.from(data['members'] ?? []),
          lastMessage: data['lastMessage'],
          lastMessageTime: (data['updatedAt'] as Timestamp?)?.toDate(),
          isGroup: data['isGroup'] ?? false,
        );
      }).toList();
    });
  }

  @override
  Stream<List<Message>> getMessages(String roomId) {
    // Lấy tin nhắn realtime từ Realtime Database
    return _rtdb.ref('messages/$roomId').orderByChild('timestamp').onValue.map((event) {
      final Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data == null) return [];

      final messages = data.entries.map((entry) {
        final value = Map<String, dynamic>.from(entry.value as Map);
        return Message(
          id: entry.key as String,
          senderId: value['senderId'] ?? '',
          content: value['text'] ?? '',
          timestamp: DateTime.fromMillisecondsSinceEpoch(value['timestamp'] ?? 0),
        );
      }).toList();

      // Sắp xếp theo thời gian (RTDB có thể trả về không thứ tự nếu key không theo timestamp)
      messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      return messages;
    });
  }

  @override
  Future<void> sendMessage(String roomId, String content) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final timestamp = ServerValue.timestamp;
    final messageData = {
      'senderId': user.uid,
      'text': content,
      'timestamp': timestamp,
    };

    // 1. Ghi tin nhắn vào RTDB
    await _rtdb.ref('messages/$roomId').push().set(messageData);

    // 2. Cập nhật metadata vào Firestore (lastMessage, updatedAt)
    await _firestore.collection('conversations').doc(roomId).update({
      'lastMessage': content,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}

// Cập nhật provider để sử dụng FirebaseChatRepository nếu người dùng đã login
final firebaseChatRepositoryProvider = Provider<FirebaseChatRepository>((ref) {
  return FirebaseChatRepository();
});
