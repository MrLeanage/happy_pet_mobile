
class PublicAPIService{
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