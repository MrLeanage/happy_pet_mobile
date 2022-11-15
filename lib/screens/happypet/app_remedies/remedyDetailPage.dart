import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/app_remedies/startDiagnosticPage.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:happy_pet/utils/utility.dart';

class RemedyDetailPage extends StatefulWidget {
  final imgPath;

  RemedyDetailPage({Key? key, this.imgPath}) : super(key: key);

  @override
  _RemedyDetailPageState createState() => _RemedyDetailPageState(imgPath);
}

class _RemedyDetailPageState extends State<RemedyDetailPage> {
  String imagePath;
  _RemedyDetailPageState(this.imagePath);
  String petID = 'p123';
  String userID = 'xyz@gmail.com';

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
            padding: EdgeInsets.only(top: size.height * 0.44, left: size.width * 0.012, right:size.width * 0.012 ),
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
                            height: 40,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              gradient: customHeaderLinearGradient(Colors.blue, COLOR_WHITE),
                            ),
                            child: Text(
                              'ALOEVERA TREATMENT FOR ACNE',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: COLOR_WHITE
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10, right: 10),

                            child: Text(
                              'by Rahul K',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: COLOR_BLACK
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.9,
                            padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
                            color: Colors.orange[100],
                            child: customRatingBar(1, 5),
                          ),


                        ],
                      )
                  ),
                ),
                SizedBox(height: 5),
                // new Align(
                //   alignment: Alignment.topCenter,
                //   child: Container(
                //       width: MediaQuery.of(context).size.width,
                //       height: MediaQuery.of(context).size.height * 0.3,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //         color: Colors.white70.withOpacity(0.8),
                //       ),
                //       child: new Column(
                //         children: <Widget>[
                //           SizedBox(height: 10),
                //           Container(
                //             alignment: Alignment.centerLeft,
                //             padding: EdgeInsets.only(left: 10, right: 10),
                //             decoration: BoxDecoration(
                //               gradient: customHeaderLinearGradient(Colors.blue, COLOR_WHITE),
                //             ),
                //             child: Row(
                //
                //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: <Widget>[
                //                 Text(
                //                   'Examine My Pet',
                //                   style: TextStyle(
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.w900,
                //                       color: COLOR_WHITE
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Container(
                //             alignment: Alignment.centerLeft,
                //             padding: EdgeInsets.only(left: 10, right: 10),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 SizedBox(height: size.height * 0.005,),
                //                 Row(
                //                   children: [
                //                     Container(
                //                       width: size.width*0.9,
                //                       height: size.height*0.135 ,
                //                       child: Padding(
                //                         padding: const EdgeInsets.all(0),
                //                         child: RichText(
                //                           maxLines: null,
                //                           textAlign: TextAlign.justify,
                //                           text: TextSpan(
                //
                //                             text: "Happy Pet helps you to identify skin diseases of your pet. If you feel any skin disease condition on your pet, use out diagnostic tool bellow to diagnose your pet and get home remedies ",
                //                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: COLOR_BLACK),
                //
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //
                //                   ],
                //                 ),
                //                 Row(
                //                   children: [
                //                     Container(
                //                       height: size.height * 0.1,
                //                       width: size.width * 0.9,
                //                       padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
                //                       // color: Colors.redAccent,
                //                       child: ElevatedButton(
                //                         onPressed: () =>{
                //                           print('Edit Clicked'),
                //                           Navigator.of(context).push(MaterialPageRoute(
                //                               builder: (context) => StartDiagnosisPage(
                //                                 petID: petID,
                //                                 userID: userID,
                //                               )
                //                           )
                //                           )
                //                         },
                //                         child: Wrap(children : [
                //                           Icon(
                //                             Icons.local_hospital_sharp,
                //                             color: COLOR_WHITE,
                //                           ),
                //                           SizedBox(width: 20,),
                //                           Text(
                //                               'DIAGNOSE MY PET NOW',
                //                             style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 20
                //                             ),
                //                           )
                //                         ],),
                //                         style: ElevatedButton.styleFrom(
                //                           primary: Colors.blueAccent,
                //                         ),
                //                       ),
                //                     ),
                //
                //                   ],
                //                 ),
                //
                //               ],
                //             ),
                //           )
                //
                //         ],
                //       )
                //   ),
                // ),
                SizedBox(height: 5),
                new Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.amber[100],
                      ),
                      child: new Column(
                        children: <Widget>[
                          SizedBox(height: 15),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 30, right: 10),
                            decoration: BoxDecoration(
                              gradient: customHeaderLinearGradient(COLOR_GREY, COLOR_WHITE),
                            ),
                            child: Row(

                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'REMEDY INFORMATION',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: COLOR_WHITE
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //     padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                          //     child: Divider(color: Colors.white,)
                          // ),
                          // SizedBox(height: 5),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20, right: 20),
                          //   child: Row(
                          //     children: <Widget>[
                          //       Text("Recently Found Disease :", style: new TextStyle(color: Colors.black),),
                          //       Spacer(),
                          //       Text("No Disease", style: new TextStyle(color: Colors.black),),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 10),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20, right: 20),
                          //   child: Row(
                          //     children: <Widget>[
                          //       Text("Recently Used Home Remedy :", style: new TextStyle(color: Colors.black),),
                          //       Spacer(),
                          //       Text("None", style: new TextStyle(color: Colors.black),),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 10),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20, right: 20),
                          //   child: Row(
                          //     children: <Widget>[
                          //       Text("Recorded disease Since :", style: new TextStyle(color: Colors.black),),
                          //       Spacer(),
                          //       Text("None", style: new TextStyle(color: Colors.black),),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                              child: Divider(color: Colors.black,)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Container(
                              color: Colors.white70,
                              height: size.height * 0.3,
                              // child: ListView(
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Container(
                              //           width: size.width * 0.75,
                              //           alignment: Alignment.centerLeft,
                              //           padding: EdgeInsets.all(10),
                              //           color: Colors.black54,
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //
                              //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     '1. Dandruff Infection ',
                              //                     style: TextStyle(
                              //                         fontSize: 18,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               Row(
                              //
                              //                 mainAxisAlignment: MainAxisAlignment.end,
                              //                 // crossAxisAlignment: CrossAxisAlignment.end,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     'on  01/01/2022',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: size.width * 0.14,
                              //           height: 70 ,
                              //           child: ElevatedButton(
                              //
                              //             onPressed: () => {},
                              //             // child: Icon(
                              //             //     Icons.arrow_forward_ios
                              //             // ),
                              //             child: Wrap(children : [
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 color: COLOR_WHITE,
                              //                 size: 20,
                              //               ),
                              //             ],),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(height: 5,),
                              //     Row(
                              //       children: [
                              //         Container(
                              //           width: size.width * 0.75,
                              //           alignment: Alignment.centerLeft,
                              //           padding: EdgeInsets.all(10),
                              //           color: Colors.black54,
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //
                              //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     '2. Lupus Infection ',
                              //                     style: TextStyle(
                              //                         fontSize: 18,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               Row(
                              //
                              //                 mainAxisAlignment: MainAxisAlignment.end,
                              //                 // crossAxisAlignment: CrossAxisAlignment.end,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     'on  01/02/2022',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: size.width * 0.14,
                              //           height: 70 ,
                              //           child: ElevatedButton(
                              //
                              //             onPressed: () => {},
                              //             // child: Icon(
                              //             //     Icons.arrow_forward_ios
                              //             // ),
                              //             child: Wrap(children : [
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 color: COLOR_WHITE,
                              //                 size: 20,
                              //               ),
                              //             ],),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(height: 5,),
                              //     Row(
                              //       children: [
                              //         Container(
                              //           width: size.width * 0.75,
                              //           alignment: Alignment.centerLeft,
                              //           padding: EdgeInsets.all(10),
                              //           color: Colors.black54,
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //
                              //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     '3. Ringworm Infection ',
                              //                     style: TextStyle(
                              //                         fontSize: 18,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               Row(
                              //
                              //                 mainAxisAlignment: MainAxisAlignment.end,
                              //                 // crossAxisAlignment: CrossAxisAlignment.end,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     'on  01/03/2022',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: size.width * 0.14,
                              //           height: 70 ,
                              //           child: ElevatedButton(
                              //
                              //             onPressed: () => {},
                              //             // child: Icon(
                              //             //     Icons.arrow_forward_ios
                              //             // ),
                              //             child: Wrap(children : [
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 color: COLOR_WHITE,
                              //                 size: 20,
                              //               ),
                              //             ],),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(height: 5,),
                              //     Row(
                              //       children: [
                              //         Container(
                              //           width: size.width * 0.75,
                              //           alignment: Alignment.centerLeft,
                              //           padding: EdgeInsets.all(10),
                              //           color: Colors.black54,
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //
                              //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     '4. Impetigo Infection ',
                              //                     style: TextStyle(
                              //                         fontSize: 18,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               Row(
                              //
                              //                 mainAxisAlignment: MainAxisAlignment.end,
                              //                 // crossAxisAlignment: CrossAxisAlignment.end,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     'on  01/04/2022',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: size.width * 0.14,
                              //           height: 70 ,
                              //           child: ElevatedButton(
                              //
                              //             onPressed: () => {},
                              //             // child: Icon(
                              //             //     Icons.arrow_forward_ios
                              //             // ),
                              //             child: Wrap(children : [
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 color: COLOR_WHITE,
                              //                 size: 20,
                              //               ),
                              //             ],),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(height: 5,),
                              //     Row(
                              //       children: [
                              //         Container(
                              //           width: size.width * 0.75,
                              //           alignment: Alignment.centerLeft,
                              //           padding: EdgeInsets.all(10),
                              //           color: Colors.black54,
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //
                              //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     '5. Yeast Infection Infection ',
                              //                     style: TextStyle(
                              //                         fontSize: 18,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               Row(
                              //
                              //                 mainAxisAlignment: MainAxisAlignment.end,
                              //                 // crossAxisAlignment: CrossAxisAlignment.end,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     'on  01/05/2022',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: size.width * 0.14,
                              //           height: 70 ,
                              //           child: ElevatedButton(
                              //
                              //             onPressed: () => {},
                              //             // child: Icon(
                              //             //     Icons.arrow_forward_ios
                              //             // ),
                              //             child: Wrap(children : [
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 color: COLOR_WHITE,
                              //                 size: 20,
                              //               ),
                              //             ],),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(height: 5,),
                              //     Row(
                              //       children: [
                              //         Container(
                              //           width: size.width * 0.75,
                              //           alignment: Alignment.centerLeft,
                              //           padding: EdgeInsets.all(10),
                              //           color: Colors.black54,
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //
                              //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     '6. Dandruff Infection ',
                              //                     style: TextStyle(
                              //                         fontSize: 18,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               Row(
                              //
                              //                 mainAxisAlignment: MainAxisAlignment.end,
                              //                 // crossAxisAlignment: CrossAxisAlignment.end,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     'on  01/06/2022',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: size.width * 0.14,
                              //           height: 70 ,
                              //           child: ElevatedButton(
                              //
                              //             onPressed: () => {},
                              //             // child: Icon(
                              //             //     Icons.arrow_forward_ios
                              //             // ),
                              //             child: Wrap(children : [
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 color: COLOR_WHITE,
                              //                 size: 20,
                              //               ),
                              //             ],),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(height: 5,),
                              //     Row(
                              //       children: [
                              //         Container(
                              //           width: size.width * 0.75,
                              //           alignment: Alignment.centerLeft,
                              //           padding: EdgeInsets.all(10),
                              //           color: Colors.black54,
                              //           child: Column(
                              //             children: [
                              //               Row(
                              //
                              //                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 crossAxisAlignment: CrossAxisAlignment.start,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     '7. Yeast Infection ',
                              //                     style: TextStyle(
                              //                         fontSize: 18,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //               Row(
                              //
                              //                 mainAxisAlignment: MainAxisAlignment.end,
                              //                 // crossAxisAlignment: CrossAxisAlignment.end,
                              //                 children: <Widget>[
                              //                   Text(
                              //                     'on  01/07/2022',
                              //                     style: TextStyle(
                              //                         fontSize: 15,
                              //                         fontWeight: FontWeight.w900,
                              //                         color: COLOR_WHITE
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //         SizedBox(
                              //           width: size.width * 0.14,
                              //           height: 70 ,
                              //           child: ElevatedButton(
                              //
                              //             onPressed: () => {},
                              //             // child: Icon(
                              //             //     Icons.arrow_forward_ios
                              //             // ),
                              //             child: Wrap(children : [
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 color: COLOR_WHITE,
                              //                 size: 20,
                              //               ),
                              //             ],),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
                SizedBox(height: 10,)

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
                              height: size.height * 0.18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                image: DecorationImage(image: AssetImage(imagePath),
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
                                gradient: customHeaderLinearGradient(COLOR_GREY, COLOR_WHITE),
                              ),
                            child: Text('Remedy for Acne',
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
