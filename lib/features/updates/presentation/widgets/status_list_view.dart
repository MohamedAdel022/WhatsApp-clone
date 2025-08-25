import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/status_card_item.dart';

class StatusListView extends StatelessWidget {
  const StatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h, // Set a fixed height for horizontal scrolling
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return StatusCardItem();
        },
      ),
    );
  }
}

