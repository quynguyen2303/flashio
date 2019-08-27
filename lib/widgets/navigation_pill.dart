import 'package:flutter/material.dart';

import '../config/Palette.dart';

class NavigationPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 5,
      decoration: new BoxDecoration(
        color: Palette.accentColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }
}
