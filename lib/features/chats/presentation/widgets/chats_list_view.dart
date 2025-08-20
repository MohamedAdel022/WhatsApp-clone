import 'package:flutter/material.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChatListViewItem();
      },
    );
  }
}

class ChatListViewItem extends StatelessWidget {
  const ChatListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final index = 0;
    return ListTile(
      style: ListTileStyle.list,
      contentPadding: EdgeInsets.zero,
      tileColor: Colors.transparent,
      selectedColor: Colors.grey,
      selectedTileColor: Colors.grey.shade200,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: Text('C${index + 1}'),
      ),
      title: Text('Chat ${index + 1}'),
      subtitle: Text('Last message from Chat ${index + 1}'),
      trailing: Text('10:${index % 60}'),
    );
  }
}
