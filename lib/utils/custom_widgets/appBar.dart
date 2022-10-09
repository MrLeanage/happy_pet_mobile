
import 'package:flutter/material.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';

import '../constants.dart';

Widget customAppBar(double screenHeight, double screenWidth, GlobalKey<ScaffoldState> _scaffoldKey){
  return Container(
    height: screenHeight * 0.10,
    width: screenWidth,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            // bottomLeft: Radius.circular(screenHeight * 0.02),
            // bottomRight: Radius.circular(screenHeight * 0.02)
        ),
        color: COLOR_WHITE,
        boxShadow: [
          BoxShadow (
              color: COLOR_BLACK.withOpacity(0.35),
              offset: new Offset(-10.0, 10.0),
              blurRadius: 20.0,
              spreadRadius: 5.0
          ),
        ]
    ),
    child: Container(
      child: Row(
        children: <Widget>[

          Container(
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              icon: Icon(Icons.menu, size: 50,),
              color: COLOR_BROWN,
            ),
          ),



          Image.asset(
            'assets/logo-cover.png',
            width: screenWidth * 0.65,
          )
        ],
      ),
      ),
  );
}