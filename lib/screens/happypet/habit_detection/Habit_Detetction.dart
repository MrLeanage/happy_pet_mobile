import 'dart:ui';

import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
import 'package:happy_pet/utils/custom_widgets/appBar.dart';
import 'package:happy_pet/utils/custom_widgets/pageHeading_widget.dart';
import 'package:happy_pet/utils/custom_widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class HabitDetection extends StatefulWidget {
  @override
  _HabitDetectionState createState() => _HabitDetectionState();
}

class _HabitDetectionState extends State<HabitDetection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
      backgroundColor: COLOR_BACKGROUND,

      body: Column(
        children: [
          customAppBar(size.height, size.width, _scaffoldKey),
          PageHeadingWidget("HABIT DETECTION", Icons.query_builder, size.height, size.width),

        ],
      ),
    );
  }
}