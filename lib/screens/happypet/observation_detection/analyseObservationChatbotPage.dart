
import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;

import 'package:bubble/bubble.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/image_detection/analysePetImagesPage.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:image_picker/image_picker.dart';

class AnalyseObservationChatBotPage extends StatefulWidget {
  final petID;
  final userID;


  AnalyseObservationChatBotPage({Key? key, this.petID, this.userID}) : super(key: key);

  @override
  _AnalyseObservationChatBotPageState createState() => _AnalyseObservationChatBotPageState(petID, userID);
}

class _AnalyseObservationChatBotPageState extends State<AnalyseObservationChatBotPage> {
  List<String> _data = [];
  String petID;
  String userID;
  _AnalyseObservationChatBotPageState(this.petID, this.userID);

  static const String id = 'photoPicker_screen';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final Uri botUrl = Uri.parse('http://mrleanage.pythonanywhere.com/analyse_user_input');



  String _last_input = '';


  TextEditingController queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _data.insert(0, 'Hello..<bot>');
    _data.insert(1, "We want to collect information about your pet's behavior in order to identify the disease.<bot>");
    _data.insert(2, "If the behavior is not state 'NO', else answer 'YES'. <bot>");
    _data.insert(3, 'So, lets start the Q&A <bot>');
    _data.insert(4, "Okay Lets start.");


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
            // child: ListView(
            //   children: [
            //     new Align(
            //       alignment: Alignment.topCenter,
            //       child: Container(
            //           width: MediaQuery.of(context).size.width,
            //           height: MediaQuery.of(context).size.height,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(20)),
            //             color: Colors.white70.withOpacity(0.8),
            //           ),
            //           child: new Column(
            //             children: <Widget>[
            //               SizedBox(height: 10),
            //
            //               Container(
            //                 alignment: Alignment.centerLeft,
            //                 padding: EdgeInsets.only(left: 10, right: 10),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     SizedBox(height: size.height * 0.005,),
            //                     Row(
            //                       children: [
            //                         Container(
            //                           width: size.width*0.9,
            //                           height: size.height*0.12 ,
            //                           child: Padding(
            //                             padding: const EdgeInsets.all(0),
            //                             child: RichText(
            //                               maxLines: null,
            //                               textAlign: TextAlign.justify,
            //                               text: TextSpan(
            //
            //                                 text: "Happy Pet is ready to start your pet's diagnosis for the skin diseases. Please tap on START button to start the diagnosis",
            //                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: COLOR_BLACK),
            //
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //
            //                       ],
            //                     ),
            //                     Row(
            //                       children: [
            //                         // Container(
            //                         //   height: size.height * 0.1,
            //                         //   width: size.width * 0.9,
            //                         //   padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            //                         //   // color: Colors.redAccent,
            //                         //   child: ElevatedButton(
            //                         //     onPressed: () => {
            //                         //       print('Edit Clicked'),
            //                         //       Navigator.of(context).push(MaterialPageRoute(
            //                         //           builder: (context) => AnalysePetImagesPage(
            //                         //             petID: "p123",
            //                         //             userID: "u123",
            //                         //           )
            //                         //       )
            //                         //       )},
            //                         //     child: Wrap(children : [
            //                         //       Icon(
            //                         //         Icons.check,
            //                         //         color: COLOR_WHITE,
            //                         //         size: 30,
            //                         //       ),
            //                         //       SizedBox(width: 20,),
            //                         //       Text(
            //                         //         'CHAT BOT',
            //                         //         style: TextStyle(
            //                         //             fontWeight: FontWeight.bold,
            //                         //             fontSize: 25
            //                         //         ),
            //                         //       )
            //                         //     ],),
            //                         //     style: ElevatedButton.styleFrom(
            //                         //       primary: Colors.blueAccent,
            //                         //     ),
            //                         //   ),
            //                         // ),
            //
            //                       ],
            //                     ),
            //
            //                   ],
            //                 ),
            //
            //               )
            //
            //             ],
            //           )
            //       ),
            //     ),
            //     SizedBox(height: 5),
            //
            //   ],
            // ),
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.065),
              child: Container(
                height: size.height * 0.585,
                color: Colors.white,
                child: Stack(

                  children: <Widget>[
                    AnimatedList(
                      padding: EdgeInsets.all(16.0),
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
                          color: Colors.deepPurpleAccent,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.white
                              ),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                  hintText: "Message",
                                  fillColor: Colors.white
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
                )
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
                            image: AssetImage(APP_BACKGROUND_PATH),
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
                                image: DecorationImage(image: AssetImage(APP_ASK_OBSERVATION_COVER),
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
                            child: Text('DIAGNOSING OBSERVATIONS',
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
      ),
    );
  }

  //response
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
                      color: mine? Colors.white : Colors.black
                  ),
                ),
                color: mine? Colors.deepPurpleAccent : Colors.grey[200],
                padding: BubbleEdges.all(10)
            ),
          ),

        ),

      );
  }
}


