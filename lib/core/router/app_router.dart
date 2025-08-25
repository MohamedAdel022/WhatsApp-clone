import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app_clone/core/router/routes.dart';
import 'package:whats_app_clone/features/chats/presentation/views/chat_view.dart';
import 'package:whats_app_clone/features/chats/presentation/views/chats_view.dart';
import 'package:whats_app_clone/features/home/presentation/views/home_view.dart';
import 'package:whats_app_clone/features/updates/presentation/views/updates_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.chats, // default tab
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomeView(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.chats,
            name: 'chats',
            builder: (context, state) => const ChatsView(),
          ),
          GoRoute(
            path: Routes.updates,
            name: 'updates',
            builder: (context, state) => UpdatesView(),
          ),
          GoRoute(
            path: Routes.communities,
            name: 'communities',
            builder: (context, state) =>
                const Center(child: Text("👥 Communities")),
          ),
          GoRoute(
            path: Routes.calls,
            name: 'calls',
            builder: (context, state) => const Center(child: Text("📞 Calls")),
          ),
        ],
      ),
      GoRoute(
        path: Routes.chat,
        name: 'chat',
        builder: (context, state) => const ChatView(),
      ),
    ],
  );
}
