import 'package:flutter/material.dart';

class ReceivedMessageBubblePainter extends CustomPainter {
  final Color color;

  ReceivedMessageBubblePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Start from top-left tail
    path.moveTo(0, 0);
    path.lineTo(8, 12);
    path.lineTo(8, size.height - 12);

    // Bottom-left corner
    path.quadraticBezierTo(8, size.height, 20, size.height);

    // Bottom edge
    path.lineTo(size.width - 12, size.height);

    // Bottom-right corner
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - 12,
    );

    // Right edge
    path.lineTo(size.width, 12);

    // Top-right corner
    path.quadraticBezierTo(size.width, 0, size.width - 12, 0);

    // Top edge to tail
    path.lineTo(20, 0);

    // Create the tail (top-left sharp corner)
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
