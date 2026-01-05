import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models.dart';

abstract class ChatRepository {
  Stream<List<ChatRoom>> getChatRooms();
  Stream<List<Message>> getMessages(String roomId);
  Future<void> sendMessage(String roomId, String content);
}

class MockChatRepository implements ChatRepository {
  @override
  Stream<List<ChatRoom>> getChatRooms() {
    return Stream.value([
      ChatRoom(
        id: '1',
        name: 'Dự án OnlyChat',
        participants: ['user1', 'user2'],
        lastMessage: 'Chào mọi người, whitepaper đã sẵn sàng!',
        lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
        isGroup: true,
      ),
      ChatRoom(
        id: '2',
        name: 'Nguyễn Văn A',
        participants: ['user1', 'user3'],
        lastMessage: 'Bạn rảnh không?',
        lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ]);
  }

  @override
  Stream<List<Message>> getMessages(String roomId) {
    return Stream.value([
      Message(
        id: 'm1',
        senderId: 'user3',
        content: 'Chào bạn!',
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      Message(
        id: 'm2',
        senderId: 'user1',
        content: 'Chào A, mình đây.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 9)),
      ),
      Message(
        id: 'm3',
        senderId: 'user3',
        content: 'Bạn rảnh không?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
      ),
    ]);
  }

  @override
  Future<void> sendMessage(String roomId, String content) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    print('Sending message to $roomId: $content');
  }
}

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return MockChatRepository();
});

final chatRoomsProvider = StreamProvider<List<ChatRoom>>((ref) {
  return ref.watch(chatRepositoryProvider).getChatRooms();
});

final messagesProvider = StreamProvider.family<List<Message>, String>((ref, roomId) {
  return ref.watch(chatRepositoryProvider).getMessages(roomId);
});
