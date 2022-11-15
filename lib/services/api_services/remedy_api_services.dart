import 'dart:convert';
import 'dart:io';

import 'package:happy_pet/model/remedy.dart';
import 'package:happy_pet/model/remedyAnalyse.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:http/http.dart' as http;

class RemedyAPIService{
  final String _remedyAnalysisServerName = 'happypet4';


  Future<Remedy> checkNewRemedyExistence(Remedy newRemedy) async {
    print("New Remedy :" + newRemedy.remedyTitle);
    late Remedy analysedRemedy;
    var url = Uri.parse('http://' + _remedyAnalysisServerName +
        '.pythonanywhere.com/check_remedy/');
    //encode Map to JSON

    Map data = {"disease": newRemedy.diseaseName,
      "remedy-id": "0000",
      "title": newRemedy.remedyTitle,
      "brief-intro": newRemedy.remedyBrief,
      "steps": newRemedy.remedySteps
    };
    //encode Map to JSON
    var body = json.encode(data);

    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if (response.statusCode == 200) {
        var decodedBody = json.decode(response.body);

        if (decodedBody['status'] == 200) {
          analysedRemedy = Remedy.fromAvailabilityJson(decodedBody);

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        } else
          ToastMessage.showErrorToast(
              "Error Occurred while Processing your data. Please Try again");
      } else {
        ToastMessage.showErrorToast(
            "Error Occurred while Retrieving  data. Please Try again");
      }
    } on Exception catch (ignoredException) {
      ToastMessage.showErrorToast(
          "Error Occurred while Retrieving data. Please Try again");
    }
    print("Server Response :  " + analysedRemedy.remedyTitle);
    return analysedRemedy;
  }

  Future<Remedy> retrainRemedyModel(Remedy newRemedy) async {
    late Remedy analysedRemedy;
    var url = Uri.parse('http://' + _remedyAnalysisServerName +
        '.pythonanywhere.com/retrain_remedies/');
    //encode Map to JSON

    Map data = {"disease": newRemedy.diseaseName,
      "remedy-id": newRemedy.id,
      "title": newRemedy.remedyTitle,
      "brief-intro": newRemedy.remedyBrief,
      "steps": newRemedy.remedySteps
    };
    //encode Map to JSON
    var body = json.encode(data);

    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if (response.statusCode == 200) {
        var decodedBody = json.decode(response.body);

        if (decodedBody['status'] == 200) {
          analysedRemedy = Remedy.fromRetrainJson(decodedBody);

          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        } else
          ToastMessage.showErrorToast(
              "Error Occurred while Processing your data. Please Try again");
      } else {
        ToastMessage.showErrorToast(
            "Error Occurred while Retrieving  data. Please Try again");
      }
    } on Exception catch (ignoredException) {
      ToastMessage.showErrorToast(
          "Error Occurred while Retrieving data. Please Try again");
    }
    print("Server Response :  " + analysedRemedy.remedyTitle);
    return analysedRemedy;
  }
}