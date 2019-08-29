import 'package:flashio/config/Palette.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_app_bar.dart';
import '../widgets/chat_list.dart';
import '../widgets/input.dart';
import '../widgets/conversation_bottom_sheet.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage();
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ChatAppBar(),
        ),
        Expanded(
          flex: 11,
          child: Container(
            color: Palette.chatBackgroundColor,
            child: ChatListWidget(),
          ),
        )
      ],
    );
    
    
    
    // SafeArea(
    //   child: Scaffold(
    //       key: _scaffoldKey,
    //       appBar: ChatAppBar(), // Custom App Bar
    //       body: Stack(
    //         children: <Widget>[
    //           Column(
    //             children: <Widget>[
    //               ChatListWidget(), // Chat list
    //               GestureDetector(
    //                 child: InputWidget(),
    //                 onPanUpdate: (detail) {
    //                   if (detail.delta.dy < 0) {
    //                     _scaffoldKey.currentState
    //                         .showBottomSheet<Null>((context) {
    //                       return ConversationBottomSheet();
    //                     });
    //                   }
    //                 }, // The input section
    //               ),
    //             ],
    //           )
    //         ],
    //       )),
    // );
  }
}
