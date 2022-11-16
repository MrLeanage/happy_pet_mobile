
import 'dart:collection';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:happy_pet/model/imageAnalysis/imageAnalysis.dart';
import 'package:happy_pet/model/observationAnalysis/observationQuestion.dart';
import 'package:happy_pet/screens/happypet/observation_detection/analyseObservationChatbotPage.dart';
import 'package:happy_pet/services/api_services/firebase_api_services.dart';
import 'package:happy_pet/services/api_services/image_detection_api_services.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
import 'package:happy_pet/utils/custom_widgets/appLoader.dart';
import 'package:happy_pet/utils/custom_widgets/snackBar_widget.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:happy_pet/utils/utility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AnalysePetImagesPage extends StatefulWidget {
  final petID;
  final userID;
  static const String id = 'photoPicker_screen';

  AnalysePetImagesPage({Key? key, this.petID, this.userID}) : super(key: key);

  @override
  _AnalysePetImagesPageState createState() => _AnalysePetImagesPageState(petID, userID);
}

class _AnalysePetImagesPageState extends State<AnalysePetImagesPage> {

  String petID;
  String userID;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File? image;
  UploadTask? uploadTask;
  String pickedImageFile ='';
  late XFile? selectedImage;
  _AnalysePetImagesPageState(this.petID, this.userID);

  late List<File?> selectedImageList = [];
  final Map<String, File> selectedImageMapList = HashMap();

  late bool isLoadedData = false;

  List<ObservationQuestion> observationQuestionList = [];

  // List imageNameList = ["image_picker1302420444.jpg", "image_picker1316107505.jpg", "image_picker6078582728273119108.jpg"];

  Future selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      var a = selectedImage?.path;
      pickedImageFile = a!;

    });

    if(selectedImage == null)
      return;

    selectedImageMapList.addAll({DateTime.now().toString()+ '.jpg': File(selectedImage!.path)});
    //'image_files/$uid/'
    print(selectedImage?.path);
  }

  void selectImagesCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? selectedImage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      var a = selectedImage?.path;
      pickedImageFile = a!;

    });
    if(selectedImage == null)
      return;
    selectedImageMapList.addAll({ DateTime.now().toString()+ '.jpg': File(selectedImage.path)});

  }



  uploadFile(Size size) async {

    List<String> uploadedImageList = [];
    FirebaseApiService firebaseApiService = new FirebaseApiService();
    ImageDetectionAPIService imageDetectionAPIService = ImageDetectionAPIService();
    List<String> diseaseList = [];
    var imageAnalysis = new ImageAnalysis();
    List<String> suspectImageAnalysisDiseaseList = [];
    // List<String> diseaseList = ["Alopecia", "Comedones_blackheads", "Dranduff"];
    selectedImageMapList.forEach((key, value) {
      uploadedImageList.add(key);
    });
    await firebaseApiService.uploadImageList(selectedImageMapList, userID).whenComplete(() async => {
      //getting names of uploaded images as a list

    await Future.delayed(Duration(seconds: 3)),
      print("Image Count : "+ uploadedImageList.length.toString()),
      imageAnalysis = await imageDetectionAPIService.analyseDiseasedImageList(userID, uploadedImageList).whenComplete(() => {
        imageAnalysis.analysedImageDisease.forEach((element) {
          suspectImageAnalysisDiseaseList.add(element.diseaseName);
        }),

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AnalyseObservationChatBotPage(imageAnalysis: imageAnalysis, petID: petID, userID: userID)
          // builder: (context) => ObservationDetection()
        )),

        SmartDialog.dismiss(),
      }).timeout(Duration(seconds: 15)),
    }).timeout(Duration(seconds: 15));
  }


  @override
  Widget build(BuildContext context) {

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
            padding: EdgeInsets.only(top: size.height * 0.36, left: size.width * 0.012, right:size.width * 0.012 ),
            child: ListView(
              children: [
                new Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white70.withOpacity(0.8),
                      ),
                      child: new Column(
                        children: <Widget>[
                          SizedBox(height: size.height * 0.05),

                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: size.height * 0.0025,),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width*0.9,
                                      height: size.height*0.1 ,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: RichText(
                                          maxLines: null,
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(

                                            text: "We need some photographs of your pet where focused to the place of diseased. So Please attach some clear photographs bellow (min - 1 , max - 5)",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: COLOR_BLACK),

                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                                AbsorbPointer(
                                  absorbing: selectedImageMapList.length >= 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          IconButton(
                                            iconSize: 70,
                                            icon: const Icon(Icons.camera),
                                            onPressed: () {
                                              selectImagesCamera();
                                            },
                                          ),
                                          Text('Camera')
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            iconSize: 70,
                                            icon: const Icon(Icons.image),
                                            onPressed: () {
                                              selectImage();
                                            },
                                          ),
                                          Text('Gallery'),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: size.width*0.9,
                                      height: size.height*0.18 ,
                                      child: ListView.builder(
                                        itemCount: selectedImageMapList.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Card(
                                            child: ListTile(
                                              tileColor: Colors.grey[100],
                                              dense: true,
                                              visualDensity: VisualDensity(vertical: -3),
                                              title: Text(
                                                (index + 1).toString() +'. '+ selectedImageMapList.keys.elementAt(index),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              trailing: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.grey[100]
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    selectedImageMapList.remove(selectedImageMapList.keys.elementAt(index));
                                                  });
                                                },
                                                child:  Icon(
                                                    Icons.delete,
                                                  color: COLOR_GREY,
                                                ),
                                                
                                              ),
                                              onTap: (){
                                                debugPrint("List Tile Tapped");
                                                // Navigator.push(context, MaterialPageRoute(builder: (context){
                                                //
                                                //   // return ViewViableCrop(cropItemList[index]);
                                                // }));
                                              },

                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.1,
                                      width: size.width * 0.9,
                                      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
                                      // color: Colors.redAccent,
                                      child: ElevatedButton(
                                        onPressed:  () async {

                                          // Navigator.pop(context),
                                          // uploadFile(),
                                          //
                                          //  CircularProgressIndicator(),
                                          // print("SUCCESS")


                                          if(selectedImageMapList.length != 0){
                                            if(await Utility.validateAppInternetConnection(context)){
                                              uploadFile(size);
                                              SmartDialog.showLoading(
                                                widget: AppLoader.popupLoader(size),
                                              );
                                            }
                                          }else{
                                            Utility.showErrorSnack("Please Attach Images of your pet's diseased area before tap on UPLOAD IMAGES", context);
                                            //  final snackBar = CustomSnackBar.showErrorSnack("Please Attach Images of your pet's diseased area before tap on UPLOAD IMAGES");
                                            // //
                                            // // // Find the ScaffoldMessenger in the widget tree
                                            // // // and use it to show a SnackBar.
                                            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            // SmartDialog.showToast('test toast');
                                            // SmartDialog.showLoading(
                                            //   widget: AppLoader.popupLoader(size),
                                            //
                                            // );
                                            // await Future.delayed(Duration(seconds: 5));
                                            // SmartDialog.dismiss();
                                            // print("Clicked");
                                            // await Future.delayed(Duration(seconds: 2));
                                            // SmartDialog.dismiss();
                                          }

                                        },
                                        child: Wrap(children : [
                                          Icon(
                                            Icons.drive_folder_upload,
                                            color: COLOR_WHITE,
                                            size: 30,
                                          ),
                                          SizedBox(width: 20,),
                                          Text(
                                            'UPLOAD IMAGES',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25
                                            ),
                                          )
                                        ],),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          )

                        ],
                      )
                  ),
                ),
                SizedBox(height: 5),

              ],
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
                            image: AssetImage(APP_AVATAR_PATH),
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
                  height: MediaQuery.of(context).size.height * 0.24,
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
                              height: size.height * 0.160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                image: DecorationImage(image: AssetImage(APP_CAPTURE_IMAGES_COVER),
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
                              gradient: customHeaderLinearGradient(COLOR_BLUE, COLOR_WHITE),
                            ),
                            child: Text('UPLOAD YOUR PET\'S IMAGES',
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

  Widget listItemStats(String imgPath, String name, bool value){
    return Container(
      width: 110,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Image(image: AssetImage(imgPath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontSize: 13, color: value == true ? Colors.black : Colors.white)),
          SizedBox(height: 5),
          Switch(
            value: value,
            onChanged: (newVal){
              setState(() {
                value = newVal;
                print(newVal);
              });
            },
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}
