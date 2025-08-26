import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/utils/assets.dart';

class StoryViewBody extends StatelessWidget {
  const StoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.statusTest),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 8.0),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 5),
            builder: (context, state, child) {
              return LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                value: state,
                borderRadius: BorderRadius.circular(16),
              );
            },
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),

              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),

                child: ClipOval(
                  child: Ink.image(
                    image: AssetImage(Assets.temp),
                    fit: BoxFit.cover,
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mohamed Adel", style: TextStyle(color: Colors.white)),
                  Text(
                    "Today, 12:19 AM",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
