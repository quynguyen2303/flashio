import 'package:flutter/material.dart';

import 'chat_item.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => ChatItemWidget(index),
      reverse: true,
      controller: listScrollController,
    );
  }
}
