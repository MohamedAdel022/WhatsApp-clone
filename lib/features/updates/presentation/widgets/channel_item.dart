import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/assets.dart';
import 'package:whats_app_clone/core/utils/functions/time_formatter.dart';
import 'package:whats_app_clone/features/updates/domin/enities/channel_entity.dart';

class ChannelItem extends StatelessWidget {
  const ChannelItem({super.key, required this.channel});

  final SubscribedChannelEntity channel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
      tileColor: Colors.transparent,
      leading: CircleAvatar(
        radius: 26.r,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: AssetImage(channel.avatarUrl ?? Assets.channalTemp),
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
        channel.lastMessage,
        style: TextStyle(color: AppColors.gray1),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            formatTime(channel.lastMessageTime),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          channel.unreadCount > 0
              ? Badge(
                  label: Text(
                    channel.unreadCount.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
