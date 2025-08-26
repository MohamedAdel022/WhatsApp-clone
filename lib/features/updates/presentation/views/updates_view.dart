import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/theme/app_colors.dart';
import 'package:whats_app_clone/core/utils/functions/is_dark_mode.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/updates_view_body.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: UpdatesViewBody(),
      floatingActionButton: _buildFloatingActionButtons(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
      title: Text(
        'Updates',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _buildFloatingActionButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: "edit_fab",
          onPressed: () {
            // TODO: Implement edit functionality for status updates
          },
          backgroundColor: isDarkMode(context)
              ? AppColors.black2
              : AppColors.white,
          child: Icon(
            Icons.edit,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          heroTag: "camera_fab",
          onPressed: () {
            // TODO: Implement camera functionality for creating status updates
          },
          backgroundColor: AppColors.green3,
          child: Icon(
            Icons.camera_alt,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ],
    );
  }
}
