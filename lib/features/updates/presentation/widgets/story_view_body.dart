import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:whats_app_clone/core/utils/assets.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/bottom_story_action.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/story_bar.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/story_progress_indicator.dart';

class StoryViewBody extends StatelessWidget {
  const StoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final kb = MediaQuery.of(context).viewInsets.bottom;
    return Stack(
      children: [
        // Full screen image
        PhotoView(
          imageProvider: AssetImage(Assets.statusTest),
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            children: const [
              SizedBox(height: 8.0),
              StoryProgressIndicator(),
              SizedBox(height: 8.0),
              StoryBar(),
            ],
          ),
        ),

        Positioned(
          bottom: kb + 16,
          left: 0,
          right: 0,
          child: BottomStoryAction(
            onSendMessage: (message) {
              // Handle send message
            },
          ),
        ),
      ],
    );
  }
}
