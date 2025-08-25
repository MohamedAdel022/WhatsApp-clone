import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/status_list_view.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Status',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
        ),
        SizedBox(height: 10),
        StatusListView(),
      ],
    );
  }
}
