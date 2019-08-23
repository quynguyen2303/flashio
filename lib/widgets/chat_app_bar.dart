import 'package:flutter/material.dart';

import '../config/Palette.dart';
import '../config/Assets.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100;

  const ChatAppBar();

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    var textHeading = TextStyle(
        color: Palette.primaryTextColor,
        fontSize: 20); // Text style for the name
    var textStyle = TextStyle(
        color: Palette.secondaryTextColor); // Text style for everything else

    // double width =
    //     MediaQuery.of(context).size.width; // Calculate the screen width

    return Material(
      child: Container(
        color: Palette.primaryBackgroundColor,
        child: Row(
          children: <Widget>[
            Expanded(
              // Divide the App Bar to 7:3
              flex: 7,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // First row shows the attach icon and name
                    Expanded(
                      flex: 7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Center(
                                child: Icon(
                              Icons.attach_file,
                              color: Palette.secondaryColor,
                            )),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Quy Nguyen',
                                    style: textHeading,
                                  ),
                                  Text('@quynguyen2303', style: textStyle),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Second row contains the buttons for media
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 5, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Photos',
                              style: textStyle,
                            ),
                            VerticalDivider(
                              width: 30,
                              color: Palette.primaryTextColor,
                            ),
                            Text(
                              'Videos',
                              style: textStyle,
                            ),
                            VerticalDivider(
                              width: 30,
                              color: Palette.primaryTextColor,
                            ),
                            Text(
                              'Files',
                              style: textStyle,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // This show the circle avatar
            Expanded(
              flex: 3,
              child: Container(
                child: Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Assets.user),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
