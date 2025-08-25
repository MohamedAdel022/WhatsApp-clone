import 'package:flutter/material.dart';

class SentMessageBubblePainter extends CustomPainter {
  final Color color;

  SentMessageBubblePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Start from top-left, moving clockwise
    path.moveTo(12, 0); // Top-left corner with radius

    // Top edge to the tail start
    path.lineTo(size.width - 20, 0);

    // Create the tail (top-right sharp corner)
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 8, 12);

    // Right edge
    path.lineTo(size.width - 8, size.height - 12);

    // Bottom-right corner
    path.quadraticBezierTo(
      size.width - 8,
      size.height,
      size.width - 20,
      size.height,
    );

    // Bottom edge
    path.lineTo(12, size.height);

    // Bottom-left corner
    path.quadraticBezierTo(0, size.height, 0, size.height - 12);

    // Left edge
    path.lineTo(0, 12);

    // Top-left corner
    path.quadraticBezierTo(0, 0, 12, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}