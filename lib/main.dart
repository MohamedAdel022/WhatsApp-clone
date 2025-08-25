import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/whats_app_clone.dart';

void main() {
  // Initialize the WhatsApp application
  WidgetsFlutterBinding.ensureInitialized();
  // Run the WhatsApp application
  runApp(
    DevicePreview(
      enabled: false, 
      builder: (context) {
        return const WhatsAppClone();
      },
    ),
  );
}
