import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/core/extensions/is_not_blank.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/functions/is_dark_mode.dart';

class BottomStoryAction extends StatefulWidget {
  const BottomStoryAction({super.key, required this.onSendMessage});
  final Function(String) onSendMessage;

  @override
  State<BottomStoryAction> createState() => _BottomStoryActionState();
}

class _BottomStoryActionState extends State<BottomStoryAction> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasText = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
    print('Focus changed: $_isFocused, hasText: $_hasText');
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _textController.text.isNotBlank;
    });
    print('Text changed: $_hasText, isFocused: $_isFocused');
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
    _focusNode.dispose();
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
              focusNode: _focusNode,
              controller: _textController,
              onTapOutside: (event) {
                _focusNode.unfocus();
              },
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
                hintText: 'Reply...',
                hintStyle: TextStyle(
                  color: AppColors.gray,
                  fontSize: 14.sp,
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
            icon: Center(child: Icon(_getButtonIcon())),
            onPressed: () {
              if (_hasText) {
                _sendMessage();
              } else if (_isFocused) {
                // Handle voice recording
                print('Voice recording pressed');
              } else {
                // Handle heart/like action
                print('Heart pressed');
              }
            },
          ),
        ],
      ),
    );
  }

  IconData _getButtonIcon() {
    print('Getting icon - hasText: $_hasText, isFocused: $_isFocused');
    if (_hasText) {
      print('Showing send icon');
      return Icons.send;
    } else if (_isFocused) {
      print('Showing mic icon');
      return Icons.mic;
    } else {
      print('Showing heart icon');
      return Icons.favorite_border;
    }
  }
}
