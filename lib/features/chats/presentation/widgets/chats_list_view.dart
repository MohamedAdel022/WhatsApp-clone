import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app_clone/core/router/routes.dart';
import 'package:whats_app_clone/dummy_data.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/item_chat_list_view.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: DummyData.getChatEntities().length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.push(
              Routes.chat,
              extra: DummyData.getChatEntities()[index],
            );
          },
          onLongPress: () {},
          child: ItemChatListView(chat: DummyData.getChatEntities()[index]),
        );
      },
    );
  }
}
