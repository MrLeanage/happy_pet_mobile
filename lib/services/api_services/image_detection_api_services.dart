import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:happy_pet/model/imageAnalysis/imageAnalysis.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:happy_pet/utils/utility.dart';
import 'package:http/http.dart' as http;

class ImageDetectionAPIService{
  static final String _folderPath = 'image_files/';
  static final String _imageAnalysisServerName = 'happypet1';

  Future<ImageAnalysis> analyseDiseasedImageList(String user, List imageNameList) async {
    // late ImageAnalysis imageAnalysis = new ImageAnalysis();
    var url = Uri.parse('http://'+_imageAnalysisServerName+ '.pythonanywhere.com/analyze_image/');
    print("user in service : " + user);
    imageNameList.forEach((element) {
      print("imageList : " + element);
    });

    Map data = {
      "user-name" : user,
      "image-file-list" : imageNameList,
      "image-folder-path" : _folderPath + user + "/"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var imageAnalysis;
    var response;
    try{
      response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );

      if(response.statusCode == 200){
        // var decodedBody = json.decode(response.body);
        var decodedBody = await json.decode(response.body);

        if(decodedBody['status'] == 200){
          imageAnalysis = ImageAnalysis.fromJson(decodedBody['response']);
          // ToastMessage.showSuccessToast(imageAnalysis.analysis.toString());
        }else
          ToastMessage.showErrorToast("Error Occurred while Processing your images. Please Try again");

      }else{
        ToastMessage.showErrorToast("Error Occurred while Retrieving Data. Please Try again");
      }

    } on Exception catch(ignoredException){
      ToastMessage.showErrorToast("Error Occurred while Retrieving Data. Please Try again");
    }

    return imageAnalysis;
  }
}