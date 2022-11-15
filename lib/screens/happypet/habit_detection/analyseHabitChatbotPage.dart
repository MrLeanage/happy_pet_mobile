
import 'dart:convert';
import 'dart:ui';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:happy_pet/model/habitualQuestion.dart';
import 'package:happy_pet/model/imageAnalysis/imageAnalysis.dart';
import 'package:happy_pet/model/observationAnalysis/observationQuestion.dart';
import 'package:happy_pet/model/welcomeNote.dart';
import 'package:happy_pet/screens/happypet/habit_detection/analyseHabitChatbotPage.dart';
import 'package:happy_pet/screens/happypet/remedy_detection/diagnosisReportPage.dart';
import 'package:happy_pet/services/api_services/habitual_api_services.dart';
import 'package:http/http.dart' as http;

import 'package:bubble/bubble.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/image_detection/analysePetImagesPage.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:happy_pet/utils/custom_widgets/appLoader.dart';

class AnalyseHabitChatBotPage extends StatefulWidget {
  final petID;
  final userID;
  List<String> diseaseList;
  ImageAnalysis imageAnalysis;
  List<ObservationQuestion> answeredObservationQuestionList;
  String suspectedDiseaseFromObservations;



  AnalyseHabitChatBotPage({Key? key, this.petID, this.userID, required this.diseaseList, required this.imageAnalysis, required this.answeredObservationQuestionList, required this.suspectedDiseaseFromObservations}) : super(key: key);

  @override
  _AnalyseHabitChatBotPageState createState() => _AnalyseHabitChatBotPageState(petID, userID, diseaseList, imageAnalysis, answeredObservationQuestionList, suspectedDiseaseFromObservations);
}

class _AnalyseHabitChatBotPageState extends State<AnalyseHabitChatBotPage> {
  bool isLoading = false;
  List<String> _data = [];
  String petID;
  String userID;
  List<String> diseaseList;
  ImageAnalysis imageAnalysis;
  List<ObservationQuestion> answeredObservationQuestionList;
  String suspectedDiseaseFromObservations;

  _AnalyseHabitChatBotPageState(this.petID, this.userID, this.diseaseList, this.imageAnalysis, this.answeredObservationQuestionList, this.suspectedDiseaseFromObservations);


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  TextEditingController queryController = TextEditingController();
  List<HabitualQuestion> habitualQuestionList = [];
  late WelcomeNote welcomeNote;
  ScrollController _scrollController = new ScrollController();
  int lastCalledIndex = 0;

  String _lastInput = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchObservationInitialData();

  }

  fetchObservationInitialData() async {
    print("Init Called ");
    HabitualAPIService habitualAPIService = new HabitualAPIService();
    habitualQuestionList = await habitualAPIService.analyseDiseasedImageList(diseaseList);
    welcomeNote = await habitualAPIService.retrieveWelcomeNote();

    setState(() {
      setData();
    });
  }

  setData() async {
    insertSingleItem(welcomeNote.greeting + "<bot>");
    print( welcomeNote.greeting + "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem("Thanks for your patient."+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem("We have analysed your observation data of the pet. Now lets see the habitual patterns of the pet."+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.welcomeNote_1+ "<bot>");
    await Future.delayed(Duration(seconds: 7));
    insertSingleItem("For that we will ask some Questions from you regarding Pet's recent habitual Actions"+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.welcomeNote_2+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(welcomeNote.sentenceConnector+ "<bot>");
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(habitualQuestionList.elementAt(0).habitualQuestion+ "?..<bot>");

  }


  @override
  Widget build(BuildContext context) {



    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(APP_BACKGROUND_PATH), fit: BoxFit.cover
                )

            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: size.height * 0.34, left: size.width * 0.012, right:size.width * 0.012 ),

            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.065),
              child: Container(
                height: size.height,
                color: Colors.white,
                padding: EdgeInsets.only(top : 20, bottom: 20),
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
                          color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(

                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500

                              ),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.message,
                                    color: COLOR_BLACK,
                                  ),
                                  hintText: "Type Your Message Here",
                                  fillColor: Colors.white70
                              ),
                              controller: queryController,
                              textInputAction: TextInputAction.send,
                              onSubmitted: (msg) {
                                this.getResponse(size);
                              },

                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: size.height * 0.08),
            child: Container(
              height: size.height * 0.08,
              color: Colors.white.withOpacity(0.9),
              child: new Row(

                children: <Widget>[
                  new IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: COLOR_BROWN,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(APP_AVATAR_PATH),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 15)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.17),
            child: new Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white70.withOpacity(0.8),
                  ),
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: size.width * 0.95,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                image: DecorationImage(image: AssetImage(APP_ASK_HABIT_COVER),
                                    fit: BoxFit.cover
                                ),
                              )
                          )
                        ],
                      ),

                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                            width: size.width ,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              gradient: customHeaderLinearGradient(Colors.deepPurpleAccent, COLOR_WHITE),
                            ),
                            child: Text('DIAGNOSING HABITUAL ACTIONS',
                              style: TextStyle(
                                  color: COLOR_WHITE,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 5),

                    ],
                  )
              ),
            ),
          ),

        ],
      ) ,
    );
  }

  //response
  Future<void> getResponse(Size size) async {

    if (queryController.text.length > 0) {
      this.insertSingleItem(queryController.text);

      _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.easeOut);

      _lastInput = queryController.text;
      queryController.clear();

      if(_lastInput.toLowerCase() == 'yes' || _lastInput.toLowerCase() == 'no'){
        habitualQuestionList.elementAt(lastCalledIndex).habitualAnswer = _lastInput.toUpperCase();
        if(habitualQuestionList.length == lastCalledIndex + 1){
          habitualQuestionList.forEach((element) {
            print(element.habitualName + " : " + element.habitualAnswer);
          });
          SmartDialog.showLoading(
            widget: AppLoader.popupLoader(size));
          await Future.delayed(Duration(seconds: 10));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DiagnosisReportPage( petID: "123", userID: userID, diseaseList: diseaseList, imageAnalysis: imageAnalysis,
                answeredObservationQuestionList: answeredObservationQuestionList, suspectedDiseaseFromObservations : suspectedDiseaseFromObservations,
                answeredHabitualQuestionList: habitualQuestionList, suspectedDiseaseFromHabits: ",")
            // builder: (context) => ObservationDetection()
          ));
    }else{
    await Future.delayed(Duration(seconds: 5));
    insertSingleItem(habitualQuestionList.elementAt(lastCalledIndex + 1).habitualQuestion + "?..<bot>");
    lastCalledIndex ++;
    }

    }else if (_lastInput.toLowerCase() == 'quit'  || _lastInput.toLowerCase() == 'exit') {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
    }else{
    HabitualAPIService habitualAPIService = new HabitualAPIService();
    String response = await habitualAPIService.analyseUserInput(_lastInput);
    insertSingleItem(response + "<bot>");
    }

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
                      fontSize: 17,
                      color: mine? Colors.black : Colors.black
                  ),
                ),
                color: mine? Colors.blue[100] : Colors.grey[200],
                padding: BubbleEdges.all(10)
            ),
          ),

        ),

      );
  }
}


