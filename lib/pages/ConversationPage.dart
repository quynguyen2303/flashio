import 'package:flutter/material.dart';

import '../widgets/chat_app_bar.dart';
import '../widgets/chat_list.dart';
import '../widgets/input.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage();
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: ChatAppBar(), // Custom App Bar
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ChatListWidget(), // Chat list
                  InputWidget(), // The input section
                ],
              )
            ],
          )),
    );
  }
}
