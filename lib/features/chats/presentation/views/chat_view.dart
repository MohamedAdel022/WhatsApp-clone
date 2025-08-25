import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:whats_app_clone/core/utils/assets.dart';
import 'package:whats_app_clone/features/chats/presentation/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: ChatViewBody());
  }

  AppBar _buildAppBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final leadingWidth = screenWidth - (3 * 48);

    return AppBar(
      leadingWidth: leadingWidth,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
            ),
            icon: FaIcon(FontAwesomeIcons.arrowLeft),
            padding: EdgeInsets.zero,
            onPressed: () => context.pop(),
          ),

          CircleAvatar(
            radius: 16,
            child: ClipOval(child: Image.asset(Assets.temp, fit: BoxFit.cover)),
          ),
          SizedBox(width: 6),
          Expanded(
            child: InkWell(
              onTap: () {
                log('Tapped on name');
              },
              child: Container(
                height: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mohamed',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.video, size: 20),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.phone, size: 20),
          onPressed: () {},
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.ellipsisVertical, size: 20),
          onPressed: () {},
        ),
      ],
    );
  }
}
