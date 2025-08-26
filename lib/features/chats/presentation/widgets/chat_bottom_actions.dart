import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/core/extensions/is_not_blank.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/functions/is_dark_mode.dart';

class ChatBottomActions extends StatefulWidget {
  final Function(String) onSendMessage;

  const ChatBottomActions({super.key, required this.onSendMessage});

  @override
  State<ChatBottomActions> createState() => _ChatBottomActionsState();
}

class _ChatBottomActionsState extends State<ChatBottomActions> {
  final TextEditingController _textController = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _textController.text.isNotBlank;
    });
  }

  void _sendMessage() {
    if (_hasText) {
      widget.onSendMessage(_textController.text);
      _textController.clear();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(Icons.emoji_emotions),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(Icons.attach_file),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt),
                    ),
                  ],
                ),
                hintText: 'Message',
                hintStyle: TextStyle(
                  color: AppColors.gray,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode(context)
                        ? AppColors.black2
                        : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode(context)
                        ? AppColors.black2
                        : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode(context)
                        ? AppColors.black2
                        : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
              ),
            ),
          ),
          SizedBox(width: 4),
          IconButton.filled(
            icon: Center(child: Icon(_hasText ? Icons.send : Icons.mic)),
            onPressed: () {
              if (_hasText) {
                _sendMessage();
              } else {
                // Handle voice recording
              }
            },
          ),
        ],
      ),
    );
  }
}
