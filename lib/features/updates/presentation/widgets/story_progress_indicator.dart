import 'package:flutter/material.dart';

class StoryProgressIndicator extends StatelessWidget {
  const StoryProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 5),
      builder: (context, state, child) {
        return SizedBox(
          height: 1,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            value: state,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}
