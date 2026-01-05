enum MessageType { text, image, file }

class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final bool isRead;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.type = MessageType.text,
    this.isRead = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'content': content,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'type': type.name,
      'isRead': isRead,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      senderId: map['senderId'],
      content: map['content'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      type: MessageType.values.byName(map['type'] ?? 'text'),
      isRead: map['isRead'] ?? false,
    );
  }
}

class ChatRoom {
  final String id;
  final String name;
  final List<String> participants;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final bool isGroup;

  ChatRoom({
    required this.id,
    required this.name,
    required this.participants,
    this.lastMessage,
    this.lastMessageTime,
    this.isGroup = false,
  });

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      id: map['id'],
      name: map['name'],
      participants: List<String>.from(map['participants']),
      lastMessage: map['lastMessage'],
      lastMessageTime: map['lastMessageTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastMessageTime'])
          : null,
      isGroup: map['isGroup'] ?? false,
    );
  }
}
