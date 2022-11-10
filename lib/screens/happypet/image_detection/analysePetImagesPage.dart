
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/habit_detection/analysehabitChatbotPage.dart';
import 'package:happy_pet/screens/happypet/observation_detection/analyseObservationChatbotPage.dart';
import 'package:happy_pet/screens/happypet/remedy_detection/diagnosisReportPage.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:image_picker/image_picker.dart';

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
  String uid = "abc@gmail.com";
  _AnalysePetImagesPageState(this.petID, this.userID);

  bool tempValue = false;


  Future selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    print(selectedImage?.path);
    if(selectedImage == null)
      return;
    setState(() {
      var a = selectedImage!.path;
      pickedImageFile = a;
    }
    );
  }

  Future uploadFile() async {
    final path = 'image_files/${uid}/${selectedImage!.name}';
    final file = File(selectedImage!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download Link :  $urlDownload');
  }

  void selectImagesCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? selectedImage = await imagePicker.pickImage(source: ImageSource.camera);
    print(selectedImage?.path);
    setState(() {
      var a = selectedImage?.path;
      pickedImageFile = a!;

    }
    );
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
                          SizedBox(height: 10),

                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height * 0.005,),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width*0.9,
                                      height: size.height*0.12 ,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: RichText(
                                          maxLines: null,
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(

                                            text: "We need some photographs of your pet where focused to the place of diseased. So Please attach some clear photographs bellow (min - 2 , max - 5)",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: COLOR_BLACK),

                                          ),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                                Row(
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
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: size.width*0.9,
                                      height: size.height*0.18 ,
                                      child: ListView(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '1. IMG_2022_10_21_7800.jpg',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '2. IMG_2022_10_21_7801.jpg',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '3. IMG_2022_10_21_7802.jpg',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '4. IMG_2022_10_21_7803.jpg',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '5. IMG_2022_10_21_7804.jpg',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                        ],
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
                                        onPressed: () => {
                                          print('Edit Clicked'),
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => DiagnosisReportPage(
                                                petID: "p123",
                                                userID: "u123",
                                              )
                                          )
                                          )},
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
                            image: AssetImage(APP_BACKGROUND_PATH),
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
                  height: MediaQuery.of(context).size.height * 0.26,
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
                              height: size.height * 0.180,
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
