
import 'dart:convert';

import 'package:http/http.dart' as http;

class PublicAPIService{
  static Future<void> testAPI() async {
    // var url = Uri.parse('https://us-central1-happypet-c6527.cloudfunctions.net/helloWorldAPI');
    // var response = await http.post(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    var url = Uri.parse('http://happypet1.pythonanywhere.com/analyze_image/');

    Map data = {
      "user-name" : "abc@gmail.com",
      "image-file-list" : ["image_picker1302420444.jpg", "image_picker1316107505.jpg", "image_picker6078582728273119108.jpg"],
      "image-folder-path" : "image_files/abc@gmail.com/"
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );

    if(response.statusCode == 200){
      print(response.body);

    }else{
      print(response.body);
    }
  }
  // Future <List<Crop>> getViableCropData(String state) async {
  //   List<Crop> cropDataList = [];
  //   var url = Uri.parse('https://us-central1-farmbuddy-2021.cloudfunctions.net/onRequestViableCropList');
  //   var response = await http.post(url, body: {
  //     'geoLocation' : {
  //       'state': "western",
  //       'longitude': '7.086574',
  //       'latitude': '80.009682'
  //     }
  //   });
  //
  //
  //   if(response.statusCode == 200){
  //     var cropsJson = json.decode(response.body);
  //     for(var crop in cropsJson){
  //       cropDataList.add(Crop.fromJson(crop));
  //     }
  //   }else{
  //     // Fluttertoast.showToast(
  //     //     msg: "Error Occurred While Retrieving",
  //     //     toastLength: Toast.LENGTH_SHORT,
  //     //     gravity: ToastGravity.CENTER,
  //     //     timeInSecForIosWeb: 1,
  //     //     backgroundColor: Colors.red,
  //     //     textColor: Colors.white,
  //     //     fontSize: 16.0
  //     // );
  //   }
  //
  //   return cropDataList;
  // }
}