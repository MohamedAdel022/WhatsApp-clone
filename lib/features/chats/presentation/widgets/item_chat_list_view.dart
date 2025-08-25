import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/assets.dart';

class ItemChatListView extends StatelessWidget {
  const ItemChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    final index = 0;
    final messageCount = '999+';

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
      tileColor: Colors.transparent,
      leading: CircleAvatar(
        radius: 26.r,
        backgroundColor: Colors.grey.shade300,
        child: Image.asset(Assets.temp),
      ),
      title: Text(
        'Amr(joo)',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'Last message from Chat ${index + 1}',
        style: TextStyle(color: AppColors.gray1),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '10:${index % 60} PM',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Badge(
            label: Text(
              messageCount,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
