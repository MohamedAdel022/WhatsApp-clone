import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/core/extensions/number_formatter.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/functions/is_dark_mode.dart';
import 'package:whats_app_clone/features/updates/domin/enities/channel_entity.dart';

class FindChannelToFollowItem extends StatelessWidget {
  const FindChannelToFollowItem({super.key, required this.channel});

  final SuggestedChannelEntity channel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
      tileColor: Colors.transparent,
      leading: CircleAvatar(
        radius: 26.r,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: AssetImage(channel.avatarUrl),
      ),
      title: Text(
        channel.name,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${channel.followersCount.toAbbreviation()} followers',
        style: TextStyle(color: AppColors.gray1, fontWeight: FontWeight.bold),
      ),
      trailing: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isDarkMode(context)
              ? colorScheme.inversePrimary.withValues(alpha: 0.6)
              : colorScheme.inversePrimary.withValues(alpha: 0.9),
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
        ),
        onPressed: () {},
        child: Text('Follow'),
      ),
    );
  }
}
