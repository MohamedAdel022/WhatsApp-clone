import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/chats_list_view.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/custom_search_text_field.dart';

class ChatsViewBody extends StatelessWidget {
  const ChatsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomSearchTextField()),
          ChatsListView(),
        ],
      ),
    );
  }
}
