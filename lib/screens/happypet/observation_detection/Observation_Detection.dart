import 'dart:convert';
import 'dart:ui';

import 'package:bubble/bubble.dart';
import 'package:happy_pet/model/observationAnalysis/observationQuestion.dart';
import 'package:happy_pet/model/welcomeNote.dart';
import 'package:happy_pet/services/api_services/observation_api_services.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
import 'package:happy_pet/utils/custom_widgets/appBar.dart';
import 'package:happy_pet/utils/custom_widgets/pageHeading_widget.dart';
import 'package:happy_pet/utils/custom_widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ObservationDetection extends StatefulWidget {
  @override
  _ObservationDetectionState createState() => _ObservationDetectionState();
}

class _ObservationDetectionState extends State<ObservationDetection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final Uri botUrl = Uri.parse('http://mrleanage.pythonanywhere.com/analyse_user_input');
  List<String> _data = [];

  String _last_input = '';

  TextEditingController queryController = TextEditingController();

  List<ObservationQuestion> observationQuestionList = [];
  List<String> diseaseList = ["Alopecia", "Comedones_blackheads", "Dranduff"];
  late WelcomeNote welcomeNote;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchObservationInitialData();

  }

  fetchObservationInitialData() async {
    setState(() {
      // isLoading = true;
    });
    print("Init Called ");
    ObservationAPIService observationAPIService = new ObservationAPIService();
    observationQuestionList = await observationAPIService.analyseDiseasedImageList(diseaseList).whenComplete(() async => {



    });
    welcomeNote = await observationAPIService.retrieveWelcomeNote();

    setState(() {
      setData();
      // isLoading = false;
    });
  }

  setData() async {
    insertSingleItem(welcomeNote.greeting + "<bot>");
    print( welcomeNote.greeting + "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.welcomeNote_1+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.welcomeNote_2+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.sentenceConnector+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem("Okay Lets start.");
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      
        key: _scaffoldKey,
        drawer: SideBar(),
        backgroundColor: COLOR_BACKGROUND,

        body: Container(
          height: size.height,
          padding: EdgeInsets.only(top: size.height*0.4, bottom: 20),
          child: Stack(

            children: <Widget>[
              AnimatedList(
                controller: _scrollController,
                padding: EdgeInsets.only(top: 20, bottom: 150, left: 16, right: 16),
                key: _listKey,
                initialItemCount: _data.length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  if(index == _data.length){
                    return Container(
                      height: 250,
                    );
                  }
                  return buildItem(_data[index], animation, index);
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ColorFiltered(
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  child: Container(
                    color: COLOR_BROWN,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white
                        ),
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.message,
                              color: Colors.brown[100],
                            ),
                            hintText: "Hello HappyPet",
                            fillColor: Colors.white70
                        ),
                        controller: queryController,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (msg) {
                          _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.easeOut);
                          this.getResponse();
                        },

                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  //response
  Future<void> getResponse() async {

    if (queryController.text.length > 0) {
      this.insertSingleItem(queryController.text);
      _last_input = queryController.text;
      try{
        ObservationAPIService observationAPIService = new ObservationAPIService();
        String response = await observationAPIService.analyseUserInput(_last_input);
        insertSingleItem(response + "<bot>");
      }
      finally{
        queryController.clear();
      }

      // var client = getClient();
      // try{
      //   client.post(
      //     botUrl,
      //     body : {
      //       "user-input" : _last_input
      //     },
      //   ).. then((response) {
      //     print(response.body);
      //     Map<String, dynamic> data = jsonDecode(response.body);
      //     insertSingleItem(data['response']['response'] + "<bot>");
      //   });
      // }
      // finally{
      //   client.close();
      //   queryController.clear();
      // }
    }
  }

  void insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState!.insertItem(_data.length - 1);
  }

  http.Client getClient(){
    return http.Client();
  }


//Build widget which will take context animation and label
  Widget buildItem(String item, Animation<double> animation, int index) {
    bool mine = item.endsWith("<bot>");
    return
      SizeTransition(
      //sizeFactor: animation,
      sizeFactor: animation,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          alignment: mine ? Alignment.topLeft : Alignment.topRight,
          child: Bubble(
            child: Text(
              item.replaceAll("<bot>", ""),
              style: TextStyle(
                fontSize: 20,
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
