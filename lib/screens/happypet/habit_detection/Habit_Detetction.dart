import 'dart:convert';
import 'dart:ui';

import 'package:bubble/bubble.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
import 'package:happy_pet/utils/custom_widgets/appBar.dart';
import 'package:happy_pet/utils/custom_widgets/pageHeading_widget.dart';
import 'package:happy_pet/utils/custom_widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HabitDetection extends StatefulWidget {
  @override
  _HabitDetectionState createState() => _HabitDetectionState();
}

class _HabitDetectionState extends State<HabitDetection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final Uri botUrl = Uri.parse('http://mrleanage.pythonanywhere.com/analyse_user_input');
  List<String> _data = [];

  String _last_input = '';

  TextEditingController queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
      backgroundColor: COLOR_BACKGROUND,

      body: Stack(
        children: <Widget>[
          AnimatedList(
            key: _listKey,
            initialItemCount: _data.length,
            itemBuilder: (BuildContext context, int index,
                Animation<double> animation) {
              return buildItem(_data[index], animation, index);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child: Container(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.message,
                          color: Colors.brown[100],
                        ),
                        hintText: "Hello HappyPet",
                        fillColor: Colors.white12
                    ),
                    controller: queryController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg) {
                      this.getResponse();
                    },

                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  void getResponse() {

    if (queryController.text.length > 0) {
      this.insertSingleItem(queryController.text);
      _last_input = queryController.text;

      var client = getClient();
      try{
        client.post(
          botUrl,
          body : {
            "user-input" : _last_input
          },
        ).. then((response) {
          print(response.body);
          Map<String, dynamic> data = jsonDecode(response.body);
          insertSingleItem(data['response']['response'] + "<bot>");
        });
      }
      finally{
        client.close();
        queryController.clear();
      }
    }
  }

  void insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState!.insertItem(_data.length - 1);
  }

  //get CLient
  http.Client getClient(){
    return http.Client();
  }

//response


//Build widget which will take context animation and label
  Widget buildItem(String item, Animation<double> scaleAnimations, int index) {
    bool mine = item.endsWith("<bot>");
    return
      SizeTransition(
      //sizeFactor: animation,
      sizeFactor: scaleAnimations,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          alignment: mine ? Alignment.topLeft : Alignment.topRight,
          child: Bubble(
              child: Text(
                item.replaceAll("<bot>", ""),
                style: TextStyle(
                    color: mine? Colors.white : Colors.black
                ),
              ),
              color: mine? Colors.blue : Colors.grey[200],
              padding: BubbleEdges.all(10)
          ),
        ),

      ),

    );
  }
}
