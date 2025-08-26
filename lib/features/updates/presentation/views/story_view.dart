import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/story_view_body.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: const StoryViewBody(),
      ),
    );
  }
}
