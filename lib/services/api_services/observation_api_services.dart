import 'dart:convert';
import 'dart:io';

import 'package:happy_pet/model/remedy.dart';
import 'package:happy_pet/model/remedyAnalyse.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:http/http.dart' as http;

class ObservationAPIService{
  final String serverName = 'mrleanage';
  Future <String> analyzeNewRemedy(var array) async {
    print("Function Called");

    var arrayData = ["Hello", "Im your", "First data"];

    var url = Uri.parse('http://mrleanage.pythonanywhere.com/concat_string_array');
    Map data = {
      "string-array" : array
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print('Response Data : ' + response.statusCode.toString());

    String contactText = "";
    if(response.statusCode == 200) {
      print(response.body);
    }
    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      contactText = responseData['response']['response'];
    }else{
      ToastMessage.showErrorToast("Error Occurred While Retrieving");
    }

    return contactText;
  }

  Future <List> paragraphSplitter(String paragraph) async {
    print("Function Called");

    var paragraphData = ["Hello", "Im your", "First data"];

    var url = Uri.parse('http://mrleanage.pythonanywhere.com/paragraph_splitter');
    Map data = {
      "paragraph" : paragraph
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print('Response Data : ' + response.statusCode.toString());

    var splittedText = [];
    if(response.statusCode == 200) {
      print(response.body);
    }
    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      splittedText = responseData['response']['response'];
    }else{
      ToastMessage.showErrorToast("Error Occurred While Retrieving");
    }

    return splittedText;
  }

  Future <String> multiCharacterReplace(String text, var replacementsArray, var replacerArray) async {
    print("Function Called");
    String text  = "In this #text  I want to repkace *All Hash and #star marks with *Percentage mark and plus sign in respectively";
    var replacementsArray = ["#", "*"];
    var replacerArray = ["%", "+"];

    var url = Uri.parse('http://mrleanage.pythonanywhere.com/paragraph_splitter');
    Map data = {
      "text" : text,
      "replacements": replacementsArray,
      "replacers": replacerArray
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print('Response Data : ' + response.statusCode.toString());

    String replacedText = "";
    if(response.statusCode == 200) {
      print(response.body);
    }
    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      replacedText = responseData['response']['response'];
    }else{
      ToastMessage.showErrorToast("Error Occurred While Retrieving");
    }

    return replacedText;
  }

  Future <List> generateObservationQuestions(var diseaseList) async {
    print("Function Called");

    var diseaseList = ["Lameness", "Cold intolerance", "Weight gain"];

    var url = Uri.parse('http://mrleanage.pythonanywhere.com/generate_observation_questions');
    Map data = {
      "diseases" : diseaseList
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print('Response Data : ' + response.statusCode.toString());

    var questionList = [];
    if(response.statusCode == 200) {
      print(response.body);
    }
    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
      questionList = responseData['response']['response'];
    }else{
      ToastMessage.showErrorToast("Error Occurred While Retrieving");
    }

    return questionList;
  }
  Future <List> paraphraseText(String textToParaphrase) async {
    print("Function Called");
    // Python API CODE
    // tgt_text = []
    // url = 'https://app.plaraphy.com/api/rewriter'
    //
    // payload = 'text=Save time and immediately improve your writing with Plaraphy API.&mode=fluent&lang=es&unique=true',
    // data = {
    // 'text' : 'Please answer following Questions as \"YES\" if behavior exist otherwise with \"NO\"',
    // 'mode' : 'creative',
    // 'lang' : 'es',
    // 'unique' : 'true'
    //
    // }
    // headers = {
    // 'accept': 'application/json',
    // 'content-type': 'application/x-www-form-urlencoded',
    // 'authorization': 'Bearer 4544|wY8tL6f0MEwxxurFtFZmhQakilokRxWUOVuZ3j30',
    // }
    // response = requests.request('POST', url, data = data, headers = headers)
    //
    // for data in response.text['rewrited_lang']:
    // for lan_record in data['paraphrases']:
    // tgt_text.append(lan_record)
    //
    // return tgt_text
    String text = 'Please answer following Questions as \"YES\" if behavior exist otherwise with \"NO\"';

    var url = Uri.parse('https://app.plaraphy.com/api/rewriter');
    Map data = {
      'text' : textToParaphrase,
      'mode' : 'creative',
      'lang' : 'es',
      'unique' : 'true'
    };

    var headersData = {
      'accept': 'application/json',
      'content-type': 'application/x-www-form-urlencoded',
      'authorization': 'Bearer 4544|wY8tL6f0MEwxxurFtFZmhQakilokRxWUOVuZ3j30',
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: headersData,
        body: body
    );
    print('Response Data : ' + response.statusCode.toString());

    var paraphrasedTextList = [];
    if(response.statusCode == 200) {
      print(response.body);
    }
    if(response.statusCode == 200){
      var responseData = json.decode(response.body);
     for(data in responseData['rewrited_lang']){
       for(text in data['paraphrases']){
         paraphrasedTextList.add(text);
       }
     }
    }else{
      ToastMessage.showErrorToast("Error Occurred While Retrieving");
    }

    return paraphrasedTextList;
  }
}