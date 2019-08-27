import 'package:flutter/material.dart';

import '../config/Palette.dart';
import '../config/Styles.dart';

import 'navigation_pill.dart';
import 'chat_row.dart';

class ConservationBottomSheet extends StatefulWidget {
  @override
  _ConservationBottomSheetState createState() =>
      _ConservationBottomSheetState();

  const ConservationBottomSheet();
}

class _ConservationBottomSheetState extends State<ConservationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          NavigationPill(),
          Center(
            child: Text(
              'Message',
              style: Styles.textHeading,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 75, right: 20),
              child: Divider(
                color: Palette.accentColor,
              ),
            ),
            itemBuilder: (context, index) {
              return ChatRow();
            },
          )
        ],
      ),
    );
  }
}
