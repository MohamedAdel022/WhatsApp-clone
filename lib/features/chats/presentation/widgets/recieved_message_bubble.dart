import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/functions/is_dark_mode.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/received_message_bubble_painter.dart';

class ReceivedMessageBubble extends StatelessWidget {
  final String message;
  final String time;

  const ReceivedMessageBubble({
    super.key,
    this.message = 'Message dsafdsfsda dsafdsfasd asdfasdf sdaf ',
    this.time = '10:30 AM',
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          margin: EdgeInsets.only(left: 8, right: 60, top: 2, bottom: 2),
          child: CustomPaint(
            painter: ReceivedMessageBubblePainter(
              color: isDarkMode(context) ? AppColors.black2 : AppColors.white,
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 8, 12, 8),
              child: _buildMessageWithTime(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageWithTime(BuildContext context) {
    return _shouldUseStackLayout()
        ? _buildStackLayout(context)
        : _buildInlineLayout(context);
  }

  bool _shouldUseStackLayout() {
    return message.length > 20;
  }

  Widget _buildInlineLayout(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(child: Text(message, style: const TextStyle(fontSize: 16))),
        const SizedBox(width: 8),
        _buildTimeOnly(context),
      ],
    );
  }

  Widget _buildStackLayout(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(message, style: const TextStyle(fontSize: 16)),
        ),
        Positioned(bottom: 0, right: 0, child: _buildTimeOnly(context)),
      ],
    );
  }

  Widget _buildTimeOnly(BuildContext context) {
    return Text(
      time,
      style: TextStyle(
        color: isDarkMode(context) ? Colors.white70 : Colors.black54,
        fontSize: 12,
      ),
    );
  }
}
