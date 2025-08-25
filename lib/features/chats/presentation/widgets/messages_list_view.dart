import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/message_list_view_item.dart';

class MessagesListView extends StatefulWidget {
  const MessagesListView({super.key});

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      reverse: true,
      controller: _scrollController,
      itemBuilder: (context, index) {
        final isSentByMe = index % 2 == 0;

        return MessageListViewItem(isSentByMe: isSentByMe);
      },
    );
  }
}
