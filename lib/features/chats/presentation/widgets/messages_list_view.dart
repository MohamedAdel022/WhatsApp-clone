import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chats/domin/entities/message_entity.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/message_list_view_item.dart';

class MessagesListView extends StatefulWidget {
  final Function(Function(String)) onReady;

  const MessagesListView({super.key, required this.onReady});

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  late ScrollController _scrollController;
  List<MessageEntity> messages = [
    MessageEntity(
      id: '1',
      chatId: '1',
      senderId: 'other',
      text: 'Hello! How are you doing?',
      timestamp: DateTime.now().subtract(Duration(minutes: 30)),
    ),
    MessageEntity(
      id: '2',
      chatId: '1',
      senderId: 'user',
      text: 'I\'m doing great! Thanks for asking. How about you?',
      timestamp: DateTime.now().subtract(Duration(minutes: 25)),
    ),
    MessageEntity(
      id: '3',
      chatId: '1',
      senderId: 'other',
      text: 'I\'m good too! Just working on some Flutter projects.',
      timestamp: DateTime.now().subtract(Duration(minutes: 20)),
    ),
    MessageEntity(
      id: '4',
      chatId: '1',
      senderId: 'user',
      text: 'That sounds interesting! What kind of projects?',
      timestamp: DateTime.now().subtract(Duration(minutes: 15)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Pass the addMessage function to the parent
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onReady(addMessage);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void addMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add(
        MessageEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          chatId: '1',
          senderId: 'user',
          text: text.trim(),
          timestamp: DateTime.now(),
        ),
      );
    });

    // Scroll to bottom after adding message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // Add a dummy response after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      final responses = [
        'That\'s interesting!',
        'I see what you mean.',
        'Thanks for sharing!',
        'Cool! Tell me more.',
        'Nice!',
        'Got it!',
        'Awesome!',
      ];

      final randomResponse =
          responses[(DateTime.now().millisecond) % responses.length];

      if (mounted) {
        setState(() {
          messages.add(
            MessageEntity(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              chatId: '1',
              senderId: 'other',
              text: randomResponse,
              timestamp: DateTime.now(),
            ),
          );
        });

        // Scroll to bottom after adding response
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              0.0,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      reverse: true,
      controller: _scrollController,
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index];
        final isSentByMe = message.senderId == 'user';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: MessageListViewItem(isSentByMe: isSentByMe, message: message),
        );
      },
    );
  }
}
