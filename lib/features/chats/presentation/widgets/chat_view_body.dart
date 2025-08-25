import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/utils/assets.dart';
import 'package:whats_app_clone/core/utils/functions/is_dark_mode.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/chat_bottom_actions.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/messages_list_view.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isDarkMode(context) ? Assets.chatDarkBg : Assets.chatLightBg,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(child: MessagesListView()),

          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ChatBottomActions(),
          ),
        ],
      ),
    );
  }
}
