import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:happy_pet/model/habitualQuestion.dart';
import 'package:happy_pet/model/remedy.dart';
import 'package:happy_pet/model/remedyAnalyse.dart';
import 'package:happy_pet/model/welcomeNote.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:happy_pet/utils/utility.dart';
import 'package:http/http.dart' as http;

class HabitualAPIService{
  static final String _habitualAnalysisServerName = 'happypet3';

  Future<List<HabitualQuestion>> analyseDiseasedImageList(List<String> diseaseList) async {

    late List<HabitualQuestion> habitualQuestionList = [];
    var url = Uri.parse('http://'+_habitualAnalysisServerName+ '.pythonanywhere.com/generate_habit_questions/');

    Map data = {
      "diseases" : diseaseList
    };
    //encode Map to JSON
    var body = json.encode(data);

    try{
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if(response.statusCode == 200){
        var decodedBody = json.decode(response.body);

        if(decodedBody['status'] == 200){
          List itemList = decodedBody['response']['response']['questions'];
          itemList.forEach((element) {
            habitualQuestionList.add(HabitualQuestion.fromJson(element));
          });

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else
          ToastMessage.showErrorToast("Error Occurred while Processing your Analysing Habitual Examine data. Please Try again");

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Habitual Examine data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Habitual Examine data. Please Try again");
    }
    habitualQuestionList.forEach((element) {
      print(element.habitualQuestion);
    });
    return habitualQuestionList;
  }

  Future<WelcomeNote> retrieveWelcomeNote() async {
    late WelcomeNote welcomeNote;
    var url = Uri.parse('http://'+_habitualAnalysisServerName+ '.pythonanywhere.com/welcome_chat_user/');
    //encode Map to JSON

    try{
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
      );

      if(response.statusCode == 200){
        var decodedBody = json.decode(response.body);

        if(decodedBody['status'] == 200){
          welcomeNote = WelcomeNote.fromJson(decodedBody['response']['response']);

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else
          ToastMessage.showErrorToast("Error Occurred while Processing your Analysing Habitual Examine data. Please Try again");

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Habitual Examine data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Habitual Examine data. Please Try again");
    }
    print(welcomeNote.greeting + " " + welcomeNote.welcomeNote_1);
    return welcomeNote;
  }

  Future<String> analyseUserInput(String userInput) async {
    late String serverResponse;
    var url = Uri.parse('http://'+_habitualAnalysisServerName+ '.pythonanywhere.com/analyse_user_input/');
    //encode Map to JSON

    Map data = {
      "user-input" : userInput
    };
    //encode Map to JSON
    var body = json.encode(data);

    try{
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if(response.statusCode == 200){
        var decodedBody = json.decode(response.body);

        if(decodedBody['status'] == 200){
          serverResponse = decodedBody['response']['response'];

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else
          ToastMessage.showErrorToast("Error Occurred while Processing your data. Please Try again");

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving  data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving data. Please Try again");
    }
    print( "Server Response :  " + serverResponse);
    return serverResponse;
  }
}