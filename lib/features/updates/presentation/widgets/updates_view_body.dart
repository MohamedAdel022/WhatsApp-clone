import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/status_section.dart';

class UpdatesViewBody extends StatelessWidget {
  const UpdatesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverToBoxAdapter(child: StatusSection())],
    );
  }
}
