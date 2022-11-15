import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:happy_pet/model/observationAnalysis/observationQuestion.dart';
import 'package:happy_pet/model/remedy.dart';
import 'package:happy_pet/model/remedyAnalyse.dart';
import 'package:happy_pet/model/welcomeNote.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:happy_pet/utils/utility.dart';
import 'package:http/http.dart' as http;

class ObservationAPIService{
  static final String _observationAnalysisServerName = 'mrleanage';

  Future<List<ObservationQuestion>> analyseDiseasedImageList(List<String> diseaseList) async {

    late List<ObservationQuestion> observationQuestionList = [];
    var url = Uri.parse('http://'+_observationAnalysisServerName+ '.pythonanywhere.com/generate_observation_questions/');

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
            observationQuestionList.add(ObservationQuestion.fromJson(element));
          });

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else
          ToastMessage.showErrorToast("Error Occurred while Processing your Analysing Observation Examine data. Please Try again");

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Observation Examine data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Observation Examine data. Please Try again");
    }
    observationQuestionList.forEach((element) {
      print(element.observationQuestion);
    });
    return observationQuestionList;
  }

  Future<WelcomeNote> retrieveWelcomeNote() async {
    late WelcomeNote welcomeNote;
    var url = Uri.parse('http://'+_observationAnalysisServerName+ '.pythonanywhere.com/welcome_chat_user/');
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
          ToastMessage.showErrorToast("Error Occurred while Processing your Analysing Observation Examine data. Please Try again");

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Observation Examine data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving Analysing Observation Examine data. Please Try again");
    }
    print(welcomeNote.greeting + " " + welcomeNote.welcomeNote_1);
    return welcomeNote;
  }

  Future<String> analyseUserInput(String userInput) async {
    late String serverResponse;
    var url = Uri.parse('http://'+_observationAnalysisServerName+ '.pythonanywhere.com/analyse_user_input/');
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

  Future<String> analyseObservations(List<String> suspectedObservations) async {
    late String serverResponse;
    var url = Uri.parse('http://'+_observationAnalysisServerName+ '.pythonanywhere.com/analyse_observation_data/');
    //encode Map to JSON

    Map data = {
      "available-observations" : suspectedObservations
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