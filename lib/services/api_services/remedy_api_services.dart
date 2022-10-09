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

    // List<Shop> shopList = [];
    // var url = Uri.parse('https://us-central1-farmbuddy-2021.cloudfunctions.net/onRequestAllShopList');
    //
    //
    // var response = await http.post(url,
    //   headers: {"Content-Type": "application/json"},
    // );
    //
    // print('Response Data : ' + response.statusCode.toString());


      // for(var shop in shops){
      //   shopList.add(Shop.fromJson(shop));
      // }
    // }else{
    //   ToastMessage.showErrorToast("Error Occurred While Retrieving");
    // }
    // if(shopList.isEmpty){
    //   ToastMessage.showErrorToast("No Records Found");
    // }
    // remedy.remedySteps.forEach((element) {
    //   print(element);
    // });
    //
    String name = "Macules";
    String title = "aloe vera treatment new";
    String brief = "apply aloe vera new";
    var steps = ["Slice aloe 2t", "Get the gel ", "put  in a bowl", "smash it well", "apply on area"];
    // Slice aloe 2t. Get the gel. put  in a bowl. smash it well. apply on area

    var url = Uri.parse('http://happypet4.pythonanywhere.com/retrain_remedies');

    // Map data = {"disease": remedy.diseaseName,
    //   "remedy-id": "000",
    //   "title": remedy.remedyTitle.toString(),
    //   "brief-intro": remedy.remedyBrief.toString(),
    //   "steps": remedy.remedySteps
    // };

    Map data = {
      'disease': name,
      'remedy-id': 101,
      'title': title,
      'brief-intro': brief,
      'steps': steps
    };

    var body = json.encode(data);

//     var postBody = json.encode(data);
//     var uri = Uri.encodeFull('http://happypet4.pythonanywhere.com/check_remedy');
//     var response = await http.post(uri as Uri, body: postBody, headers: {HttpHeaders.contentTypeHeader: " application/json"});
//     print(response.body);
//
// //Here you get the 308 error.
//
//     final getResponse =
//     await http.post(url, body: postBody, headers: {
//       HttpHeaders.contentTypeHeader: "application/json",
//     });
//     print(getResponse.body); //this is the expected response
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