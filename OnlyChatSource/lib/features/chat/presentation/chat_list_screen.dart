import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/chat_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRoomsAsync = ref.watch(chatRoomsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('OnlyChat'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.user, size: 20),
            onPressed: () {
              context.go('/login');
            },
          ),
        ],
      ),
      body: chatRoomsAsync.when(
        data: (rooms) {
          if (rooms.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.commentDots,
                    size: 64,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Chưa có cuộc trò chuyện nào',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => _showCreateChatDialog(context, ref),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Bắt đầu chat ngay'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 45),
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            itemCount: rooms.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              indent: 72,
              endIndent: 16,
              color: Color(0xFFEEEEEE),
            ),
            itemBuilder: (context, index) {
              final room = rooms[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: Text(
                    room.name[0],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  room.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  room.lastMessage ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 13,
                  ),
                ),
                trailing: room.lastMessageTime != null
                    ? Text(
                        _formatTime(room.lastMessageTime!),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    : null,
                onTap: () {
                  context.go('/chats/${room.id}?name=${room.name}');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateChatDialog(context, ref),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  void _showCreateChatDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bắt đầu chat mới'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Nhập tên phòng hoặc người nhận',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                Navigator.pop(context);
                final roomId = await ref.read(chatRepositoryProvider).createChatRoom(
                  name,
                  [], // Hiện tại chưa có flow chọn contact, tạo tạm phòng với chính mình
                );
                if (context.mounted) {
                  context.go('/chats/$roomId?name=$name');
                }
              }
            },
            child: const Text('Tạo'),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
