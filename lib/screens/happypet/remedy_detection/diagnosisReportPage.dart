import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/image_detection/analysePetImagesPage.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:happy_pet/utils/utility.dart';

class DiagnosisReportPage extends StatefulWidget {
  final petID;
  final userID;

  DiagnosisReportPage({Key? key, this.petID, this.userID}) : super(key: key);

  @override
  _DiagnosisReportPageState createState() => _DiagnosisReportPageState(petID, userID);
}

class _DiagnosisReportPageState extends State<DiagnosisReportPage> {

  String petID;
  String userID;
  _DiagnosisReportPageState(this.petID, this.userID);

  var key = GlobalKey();

  bool tempValue = false;

  double remedyBoxHeight = 0;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        remedyBoxHeight = Utility.getContainerSize(key.currentContext!).height;
      });
    });
    super.initState();
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
            padding: EdgeInsets.only(top: size.height * 0.48, left: size.width * 0.012, right:size.width * 0.012 ),
            child: ListView(
              children: [
                new Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1.5,
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
                                      height: size.height*0.05 ,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Text(
                                          'Detected Disease - Impetigo',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black
                                          ),
                                        ),
                                        // child: RichText(
                                        //   maxLines: null,
                                        //   textAlign: TextAlign.justify,
                                        //   text: TextSpan(
                                        //
                                        //     text: "Impetigo (im-peh-TIE-go) is a bacterial infection of the skin that is most common in young children. Doctors use antibiotics to treat impetigo. Antibiotics can also help protect others from getting sick",
                                        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: COLOR_BLACK),
                                        //
                                        //   ),
                                        // ),
                                      ),
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width*0.9,
                                      height: size.height*0.18 ,
                                      padding: EdgeInsets.only(left: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: RichText(
                                          maxLines: null,
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(

                                            text: "Impetigo (im-peh-TIE-go) is a bacterial infection of the skin that is most common in young children. Doctors use antibiotics to treat impetigo. Antibiotics can also help protect others from getting sick",
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
                                      width: size.width*0.9,
                                      height: size.height*0.07,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: RichText(
                                          maxLines: null,
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(

                                            text: "Following are the Observations and Habits with this disease",
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
                                      width: size.width*0.9,
                                      height: size.height*0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: RichText(
                                          maxLines: null,
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(

                                            text: "OBSERVATIONS :",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: COLOR_BLACK),

                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.2,
                                      width: size.width * 0.9,
                                      padding: EdgeInsets.only(left: 20, top: 0, bottom: 5, right: 5),
                                      // color: Colors.redAccent,
                                      child: ListView(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '1. Scratching',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '2. Hair Loss',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '3. Depression',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '4. Weight loss',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '5. Scaly skin',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                            color: Colors.grey[400],
                                            child: Text(
                                              '5. Bleeding',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width*0.9,
                                      height: size.height*0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: RichText(
                                          maxLines: null,
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(

                                            text: "HABITUAL ACTIONS :",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: COLOR_BLACK),

                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        height: size.height * 0.2,
                                        width: size.width * 0.9,
                                        padding: EdgeInsets.only(left: 20, top: 0, bottom: 5, right: 5),
                                        // color: Colors.redAccent,
                                        child: ListView(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                              color: Colors.grey[400],
                                              child: Text(
                                                '1. Depression',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                              color: Colors.grey[400],
                                              child: Text(
                                                '2. More  Sleeping and Lying',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                              color: Colors.grey[400],
                                              child: Text(
                                                '3. Scratching',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                              color: Colors.grey[400],
                                              child: Text(
                                                '4. Licking and biting infected',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                              color: Colors.grey[400],
                                              child: Text(
                                                '5. Poor grooming and Cleaning',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                              color: Colors.grey[400],
                                              child: Text(
                                                '6. Rubbing stomach or back on the floor and walls',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: size.width*0.9,
                                      height: size.height*0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: RichText(
                                          maxLines: null,
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(

                                            text: "SUGGESTED HOME REMEDIES :",
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: COLOR_BLACK),

                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        height: size.height * 0.32,
                                        width: size.width * 0.9,
                                        padding: EdgeInsets.only(left: 20, top: 0, bottom: 5, right: 5),
                                        // color: Colors.redAccent,
                                        child: ListView(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: size.width * 0.7,
                                                  padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                                  color: Colors.orange[100],
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        '1. Place the cut side of a garlic directly on impetigo sores / place a slice of ginger',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      customRatingBar(1, 5)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.12,
                                                  height: remedyBoxHeight,
                                                  child: ElevatedButton(

                                                      onPressed: () => {},
                                                      // child: Icon(
                                                      //     Icons.arrow_forward_ios
                                                      // ),
                                                    child: Wrap(children : [
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: COLOR_WHITE,
                                                        size: 20,
                                                      ),
                                                    ],),
                                                  ),
                                                ),

                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Container(
                                                  key: key,
                                                  width: size.width * 0.7,
                                                  padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                                                  color: Colors.orange[100],
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        '2. cut side down on sores / dilute grapefruit liquid extract with water and spray it on spot / use neem oil',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      customRatingBar(2, 8)
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.12,
                                                  height: remedyBoxHeight ,
                                                  child: ElevatedButton(

                                                    onPressed: () => {},
                                                    // child: Icon(
                                                    //     Icons.arrow_forward_ios
                                                    // ),
                                                    child: Wrap(children : [
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: COLOR_WHITE,
                                                        size: 20,
                                                      ),
                                                    ],),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        )
                                    ),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.08,
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
                                            'FINISH DIAGNOSE',
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
                                image: DecorationImage(image: AssetImage(APP_DIAGNOSIS_REPORT_COVER),
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
                            child: Text('DIAGNOSIS REPORT',
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
