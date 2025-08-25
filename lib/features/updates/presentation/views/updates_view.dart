import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/updates/presentation/widgets/updates_view_body.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: UpdatesViewBody(),
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
}
