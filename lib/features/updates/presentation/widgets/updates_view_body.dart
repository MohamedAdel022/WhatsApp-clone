import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/channels_section.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/find_channel_to_follow.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/status_section.dart';

class UpdatesViewBody extends StatelessWidget {
  const UpdatesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: StatusSection()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(child: ChannelsSection()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(child: FindChannelToFollow()),
      ],
    );
  }
}
