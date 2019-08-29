import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

import 'ConversationPage.dart';
import '../widgets/conversation_bottom_sheet.dart';
import '../widgets/input.dart';

class ConversationPageSlide extends StatefulWidget {
  const ConversationPageSlide();
  @override
  _ConversationPageSlideState createState() => _ConversationPageSlideState();
}

class _ConversationPageSlideState extends State<ConversationPageSlide>
    with SingleTickerProviderStateMixin {
  var controller;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = RubberAnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldState,
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              children: <Widget>[
                ConversationPage(),
                ConversationPage(),
                ConversationPage()
              ],
            ),
          ),
          Container(
            child: GestureDetector(
              child: InputWidget(),
              onPanUpdate: (detail) {
                if (detail.delta.dy < 0) {
                  _scaffoldState.currentState.showBottomSheet<Null>((context) {
                    return ConversationBottomSheet();
                  });
                }
              }, // The input section
            ),
          )
        ],
      ),
    ));

    // PageView(
    //   children: <Widget>[
    //     ConversationPage(),
    //     ConversationPage(),
    //     ConversationPage()
    //   ],

    // );
  }
}
