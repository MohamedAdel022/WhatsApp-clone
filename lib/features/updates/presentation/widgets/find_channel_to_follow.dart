import 'package:flutter/material.dart';
import 'package:whats_app_clone/dummy_data.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/find_channel_to_follow_item.dart';

class FindChannelToFollow extends StatelessWidget {
  const FindChannelToFollow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Find Channels to Follow",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(
            DummyData.getSuggestedChannels().length,
            (index) => FindChannelToFollowItem(
              channel: DummyData.getSuggestedChannels()[index],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              "Explore More",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
