import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/utils/constants.dart';
class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: <Widget>[
        Icon(Icons.verified_user, size: 20, color: COLOR_BLACK),
        Icon(Icons.add, size: 20, color: COLOR_BLACK),
        Icon(Icons.home, size: 20, color: COLOR_BLACK),
        Icon(Icons.settings, size: 20, color: COLOR_BLACK)
      ],
      onTap: (index){
        debugPrint("current Index is : $index");
      },

    );
  }
}
