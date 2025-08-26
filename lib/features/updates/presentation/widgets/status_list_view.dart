import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app_clone/core/router/routes.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/status_card_item.dart';

class StatusListView extends StatelessWidget {
  const StatusListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h, // Set a fixed height for horizontal scrolling
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 13),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: StatusCardItem(
              onTap: () {
                // Navigate to story view
               context.push(Routes.story);
              },
            ),
          );
        },
      ),
    );
  }
}
