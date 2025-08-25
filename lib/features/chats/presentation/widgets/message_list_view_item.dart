import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/recieved_message_bubble.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/sent_message_bubble.dart';

class MessageListViewItem extends StatelessWidget {
  const MessageListViewItem({super.key, required this.isSentByMe});

  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return isSentByMe ? SentMessageBubble() : ReceivedMessageBubble();
  }
}
