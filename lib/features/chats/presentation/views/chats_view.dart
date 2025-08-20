import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/theme/app_text_style.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/chats_view_body.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildChatAppBar(context), body: ChatsViewBody());
  }

  AppBar buildChatAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {},
        ),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
      title: Text('WhatsApp', style: AppTextStyle.titleLarge(context)),
    );
  }
}
