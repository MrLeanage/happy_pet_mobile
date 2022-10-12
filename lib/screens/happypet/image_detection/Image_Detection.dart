

import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
import 'package:happy_pet/utils/custom_widgets/appBar.dart';
import 'package:happy_pet/utils/custom_widgets/pageHeading_widget.dart';
import 'package:happy_pet/utils/custom_widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class ImageDetection extends StatefulWidget {
  static const String id = 'photoPicker_screen';

  const ImageDetection({Key? key}) : super(key: key);
  @override
  _ImageDetectionState createState() => _ImageDetectionState();
}

class _ImageDetectionState extends State<ImageDetection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File? image;
  String image2 ='images/img.png';

  void selectImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    print(selectedImage?.path);
    setState(() {
      var a = selectedImage?.path;
      image2 = a!;
    }
    );
  }

  void selectImagesCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? selectedImage = await imagePicker.pickImage(source: ImageSource.camera);
    print(selectedImage?.path);
    setState(() {
      var a = selectedImage?.path;
      image2 = a!;

    }
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
      backgroundColor: COLOR_BACKGROUND,

      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Choose Profile Picture',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 20,
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
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      image2
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
