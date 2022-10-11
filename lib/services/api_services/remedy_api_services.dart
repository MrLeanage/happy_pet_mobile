import 'dart:convert';
import 'dart:io';

import 'package:happy_pet/model/remedy.dart';
import 'package:happy_pet/model/remedyAnalyse.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:http/http.dart' as http;

class RemedyAPIService{
  final String serverName = 'happypet4';
  Future <RemedyAnalysis> analyzeNewRemedy(Remedy remedy) async {
    print("Function Called");
    print('Steps : ' + remedy.remedySteps.toString());
    // String name = "Macules";
    // String title = "aloe vera treatment new";
    // String brief = "apply aloe vera new";
    // var steps = ["Slice aloe 2t", "Get the gel ", "put  in a bowl", "smash it well", "apply on area"];
    // Slice aloe 2t. Get the gel. put  in a bowl. smash it well. apply on area

    var url = Uri.parse('http://happypet4.pythonanywhere.com/check_remedy');

    Map data = {"disease": remedy.diseaseName,
      "remedy-id": "000",
      "title": remedy.remedyTitle.toString(),
      "brief-intro": remedy.remedyBrief.toString(),
      "steps": remedy.remedySteps
    };

    // Map data = {
    //   'disease': name,
    //   'remedy-id': 101,
    //   'title': title,
    //   'brief-intro': brief,
    //   'steps': steps
    // };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print('Response Data : ' + response.statusCode.toString());


    if(response.statusCode == 200) {
      print(response.body);
    }

    var remedyAnalysis;
    if(response.statusCode == 200){
      var analysisReport = json.decode(response.body);

      remedyAnalysis = RemedyAnalysis.fromJson(analysisReport);
    }else{
      ToastMessage.showErrorToast("Error Occurred While Retrieving");
    }
    // if(remedyAnalysis.isEmpty){
    //   ToastMessage.showErrorToast("No Records Found");
    // }

    return remedyAnalysis;
  }

  Future <RemedyAnalysis> retrainModelForNewRemedy(Remedy remedy) async {
    print("Function Called");
    print('Steps : ' + remedy.remedySteps.toString());
    // String name = "Macules";
    // String title = "aloe vera treatment new";
    // String brief = "apply aloe vera new";
    // var steps = ["Slice aloe 2t", "Get the gel ", "put  in a bowl", "smash it well", "apply on area"];
    // Slice aloe 2t. Get the gel. put  in a bowl. smash it well. apply on area

    var url = Uri.parse('http://happypet4.pythonanywhere.com/retrain_remedies');

    Map data = {"disease": remedy.diseaseName,
      "remedy-id": "000",
      "title": remedy.remedyTitle.toString(),
      "brief-intro": remedy.remedyBrief.toString(),
      "steps": remedy.remedySteps
    };

    // Map data = {
    //   'disease': name,
    //   'remedy-id': 101,
    //   'title': title,
    //   'brief-intro': brief,
    //   'steps': steps
    // };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print('Response Data : ' + response.statusCode.toString());


    if(response.statusCode == 200) {
      print(response.body);
    }

    var remedyAnalysis;
    if(response.statusCode == 200){
      var analysisReport = json.decode(response.body);

      remedyAnalysis = RemedyAnalysis.fromJson(analysisReport);
    }else{
      ToastMessage.showErrorToast("Error Occurred While Retrieving");
    }
    // if(remedyAnalysis.isEmpty){
    //   ToastMessage.showErrorToast("No Records Found");
    // }

    return remedyAnalysis;
  }
}