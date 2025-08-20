import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/whats_app.dart';

void main() {
  // Initialize the WhatsApp application
  WidgetsFlutterBinding.ensureInitialized();
  // Run the WhatsApp application
  runApp(
    DevicePreview(
      enabled: false, // Set to true to enable Device Preview
      builder: (context) {
        return const WhatsApp();
      },
    ),
  );
}
