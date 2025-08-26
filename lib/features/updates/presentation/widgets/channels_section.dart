import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/dummy_data.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/channel_item.dart';

class ChannelsSection extends StatelessWidget {
  const ChannelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Channels",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.withValues(alpha: .1),
                ),
                onPressed: () {},
                child: Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(DummyData.getSubscribedChannels().length, (index) {
            return InkWell(
              onTap: () {
                // Handle channel item tap
              },
              child: ChannelItem(
                channel: DummyData.getSubscribedChannels()[index],
              ),
            );
          }),
        ),
      ],
    );
  }
}
