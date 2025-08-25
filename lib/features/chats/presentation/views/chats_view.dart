import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/theme/app_text_style.dart';
import 'package:whats_app_clone/core/utils/assets.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/chats_view_body.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(
          Assets.icAddMessage,
          width: 28,
          height: 28,
          color: Theme.of(context).scaffoldBackgroundColor,
          fit: BoxFit.contain,
        ),
      ),
      appBar: buildChatAppBar(context),
      body: ChatsViewBody(),
    );
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
