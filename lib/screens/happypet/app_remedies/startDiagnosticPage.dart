import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/image_detection/analysePetImagesPage.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';

class StartDiagnosisPage extends StatefulWidget {
  final petID;
  final userID;

  StartDiagnosisPage({Key? key, this.petID, this.userID}) : super(key: key);

  @override
  _StartDiagnosisPageState createState() => _StartDiagnosisPageState(petID, userID);
}

class _StartDiagnosisPageState extends State<StartDiagnosisPage> {

  String petID;
  String userID;
  _StartDiagnosisPageState(this.petID, this.userID);

  bool tempValue = false;


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
            padding: EdgeInsets.only(top: size.height * 0.48, left: size.width * 0.012, right:size.width * 0.012 ),
            child: ListView(
              children: [
                new Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
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

                                            text: "Happy Pet is ready to start your pet's diagnosis for the skin diseases. Please tap on START button to start the diagnosis",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: COLOR_BLACK),

                                          ),
                                        ),
                                      ),
                                    ),

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
                                            builder: (context) => AnalysePetImagesPage(
                                              petID: "p123",
                                              userID: "u123",
                                            )
                                          )
                                        )},
                                        child: Wrap(children : [
                                          Icon(
                                            Icons.check,
                                            color: COLOR_WHITE,
                                            size: 30,
                                          ),
                                          SizedBox(width: 20,),
                                          Text(
                                              'START DIAGNOSE',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25
                                            ),
                                          )
                                        ],),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueAccent,
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
                  height: MediaQuery.of(context).size.height * 0.38,
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
                              height: size.height * 0.30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                image: DecorationImage(image: AssetImage(APP_DIAGNOSE_COVER_PATH),
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
                            child: Text('READY TO START DIAGNOSIS',
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
