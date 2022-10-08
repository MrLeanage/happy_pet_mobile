import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:happy_pet/utils/constants.dart';

import 'addSpace_widget.dart';
import 'base_widget.dart';

class Loader extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    final double padding = 10;
    final sidePadding = EdgeInsets.symmetric(horizontal: 10);
    return Scaffold(
      body: BaseWidget(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(size.height*0.3),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ],

                ),
              ),
              addVerticalSpace(padding),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SpinKitFadingCircle(
                    color: COLOR_GREEN,
                    size: 100.0,
                  ),
                ],
              ),
              Image.asset('assets/logo-cover.png'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Loading Please Wait..'
                    ),
                  )
                ],
              ),

            ],
          ),
        )
      )
    );
  }
}