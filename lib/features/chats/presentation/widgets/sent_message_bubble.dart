import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/sent_message_bubble_painter.dart';

class SentMessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isRead;

  const SentMessageBubble({
    super.key,
    this.message = 'M dasfdsafasdf me with that same wi dsafdsa dasfd dfsad  ',
    this.time = '10:30 AM',
    this.isRead = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          margin: EdgeInsets.only(left: 60, right: 8, top: 2, bottom: 2),
          child: CustomPaint(
            painter: SentMessageBubblePainter(color: AppColors.green4),
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: _buildMessageWithTime(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageWithTime() {
  
    return _shouldUseStackLayout() ? _buildStackLayout() : _buildInlineLayout();
  }

  bool _shouldUseStackLayout() {
    return message.length > 20;
  }

  Widget _buildInlineLayout() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        const SizedBox(width: 8),
        _buildTimeAndStatus(),
      ],
    );
  }

  Widget _buildStackLayout() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        Positioned(bottom: 0, right: 0, child: _buildTimeAndStatus()),
      ],
    );
  }

  Widget _buildTimeAndStatus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(time, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(width: 4),
        Icon(
          isRead ? Icons.done_all : Icons.done,
          color: isRead ? Colors.blue : Colors.white70,
          size: 16,
        ),
      ],
    );
  }
}
