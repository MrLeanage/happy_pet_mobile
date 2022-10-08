import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/habit_detection/Habit_Detetction.dart';
import 'package:happy_pet/screens/happypet/image_detection/Image_Detection.dart';
import 'package:happy_pet/screens/happypet/observation_detection/Observation_Detection.dart';
import 'package:happy_pet/screens/happypet/remedy_detection/Remedy_Detetction.dart';
import 'package:happy_pet/screens/happypet/settings/Settings_Screen.dart';
import 'package:happy_pet/utils/constants.dart';

import 'Feeds_Screen.dart';

class HomeScreen extends StatefulWidget {
  int pageNumber = 0;

  HomeScreen(this.pageNumber);

  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState(pageNumber);
}

class _HomeScreenState extends State<HomeScreen> {
  int pageNumber = 0;

  _HomeScreenState(this.pageNumber);

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var _pageController;
  List<Widget> _screens = [
    ImageDetection(),
    ObservationDetection(),
    HabitDetection(),
    RemedyDetection(),
    //Feeds(),
    //Settings(),
  ];
  void _onPageChanged(int index){}
  void _onItemTapped(int selectedIndex){
    print(selectedIndex);
    _pageController.jumpToPage(selectedIndex);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: pageNumber,
    );
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth = window.physicalSize.width;
    final double screenHeight = window.physicalSize.height;
    double iconSize = 20;
    if(screenWidth < 500){
      iconSize = 15;
    }
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(

          key: _bottomNavigationKey,
          index: pageNumber,
          height: iconSize * 2.5,
          items: <Widget>[
            Icon(Icons.add, size: iconSize, color: COLOR_WHITE),
            Icon(Icons.question_answer_rounded, size: iconSize, color: COLOR_WHITE),
            Icon(Icons.query_builder, size: iconSize, color: COLOR_WHITE),
            Icon(Icons.analytics, size: iconSize, color: COLOR_WHITE),
            //Icon(Icons.settings, size: iconSize, color: COLOR_WHITE)
          ],
          color: COLOR_BROWN,
          backgroundColor: COLOR_WHITE,
          buttonBackgroundColor: COLOR_BROWN,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _onItemTapped(index);
            });
          },
          letIndexChange: (index) => true,

        ),
      body: PageView(
        controller: _pageController,
        children: _screens,

        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),

      )
    );
  }

}
/*

 */
