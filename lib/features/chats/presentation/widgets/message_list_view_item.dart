import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chats/domin/entities/message_entity.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/recieved_message_bubble.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/sent_message_bubble.dart';

class MessageListViewItem extends StatelessWidget {
  const MessageListViewItem({
    super.key,
    required this.isSentByMe,
    required this.message,
  });

  final bool isSentByMe;
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return isSentByMe
        ? SentMessageBubble(
            message: message.text,
            time: _formatTime(message.timestamp),
          )
        : ReceivedMessageBubble(
            message: message.text,
            time: _formatTime(message.timestamp),
          );
  }

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
