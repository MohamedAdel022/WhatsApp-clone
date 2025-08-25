import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/functions/is_dark_mode.dart';

class ChatBottomActions extends StatelessWidget {
  const ChatBottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
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
                  color: isDarkMode(context) ? AppColors.black2 : Colors.white,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode(context) ? AppColors.black2 : Colors.white,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode(context) ? AppColors.black2 : Colors.white,
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
        SizedBox(width: 8),
        IconButton.filled(
          icon: Center(child: Icon(Icons.mic)),
          onPressed: () {},
        ),
      ],
    );
  }
}
