import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/chat/presentation/chat_list_screen.dart';
import '../features/chat/presentation/chat_detail_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/chats',
        builder: (context, state) => const ChatListScreen(),
        routes: [
          GoRoute(
            path: ':roomId',
            builder: (context, state) {
              final roomId = state.pathParameters['roomId']!;
              final roomName = state.uri.queryParameters['name'] ?? 'Chat';
              return ChatDetailScreen(roomId: roomId, roomName: roomName);
            },
          ),
        ],
      ),
    ],
  );
});
