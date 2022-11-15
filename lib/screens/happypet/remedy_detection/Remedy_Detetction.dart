// import 'dart:ui';
//
// import 'package:happy_pet/model/remedy.dart';
// import 'package:happy_pet/model/remedyAnalyse.dart';
// import 'package:happy_pet/services/api_services/remedy_api_services.dart';
// import 'package:happy_pet/utils/constants.dart';
// import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
// import 'package:happy_pet/utils/custom_widgets/appBar.dart';
// import 'package:happy_pet/utils/custom_widgets/pageHeading_widget.dart';
// import 'package:happy_pet/utils/custom_widgets/sidebar_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:happy_pet/utils/utility.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
//
// class RemedyDetection extends StatefulWidget {
//   @override
//   _RemedyDetectionState createState() => _RemedyDetectionState();
// }
//
// class _RemedyDetectionState extends State<RemedyDetection> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//   //form field values
//   String diseaseTitle = "";
//   String briefIntro = "";
//   var remedySteps = [];
//
//
//   //control variables
//   bool loading = false;
//
//
//   void _submit() async{
//     setState(() => loading = true) ;
//     // if(_formKey.currentState!.validate()){
//     //   //dynamic result = await _authService.registerWithEmailAndPassword(email, password);
//     //   //if(result.toString().contains('already in use by another account')){
//     //   //  setState(() => registerError = 'The email address is already in use by another account');
//     //   //}
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       key: _scaffoldKey,
//       drawer: SideBar(),
//       backgroundColor: COLOR_BACKGROUND,
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               alignment: Alignment.topCenter,
//               children: <Widget>[
//                 customAppBar(size.height, size.width, _scaffoldKey),
//
//
//
//                 // Container(
//                 //   padding: EdgeInsets.all(16),
//                 //   child: AddHomeRemedy(),
//                 // ),
//                 // addVerticalSpace(size.height),
//                 // Container(
//                 //   child: Stack(
//                 //     children: <Widget>[
//                 //       Container(
//                 //         decoration: BoxDecoration(
//                 //             color: COLOR_GREEN
//                 //         ),
//                 //       ),
//                 //       Center(
//                 //         child: Card(
//                 //           shape: RoundedRectangleBorder(
//                 //               borderRadius: BorderRadius.circular(10.0)
//                 //           ),
//                 //           child: Container(
//                 //             height: size.height*0.42,
//                 //             width: 300,
//                 //             padding: EdgeInsets.all(16),
//                 //             child: Form(
//                 //               key: _scaffoldKey,
//                 //               child: SingleChildScrollView(
//                 //                 child: Column(
//                 //                   children: <Widget>[
//                 //                     // Image.asset('assets/logo-cover.png'),
//                 //                     //Email Field
//                 //                     TextFormField(
//                 //                       decoration: InputDecoration(labelText: 'TITLE'),
//                 //                       keyboardType: TextInputType.text,
//                 //                       validator: (value){
//                 //                         if(value!.isEmpty){
//                 //                           return 'Give a Title for your remedy!';
//                 //                         }
//                 //                         return null;
//                 //                       },
//                 //                       onChanged: (value){
//                 //                         setState(() => diseaseTitle = value);
//                 //                       },
//                 //                     ),
//                 //                     // password Field
//                 //                     TextFormField(
//                 //                       decoration: InputDecoration(labelText: 'REMEDY SUMMARY'),
//                 //                       keyboardType: TextInputType.multiline,
//                 //                       validator: (value){
//                 //                         if(value!.isEmpty){
//                 //                           return 'Please provide a Summary of your remedy steps';
//                 //                         }
//                 //                         return null;
//                 //                       },
//                 //                     ),
//                 //                     //Confirm Password
//                 //                     SizedBox(
//                 //                       height: 4,
//                 //                     ),
//                 //                     Row(
//                 //                       children: [
//                 //                         Text(
//                 //                           "NEW REMEDY STEPS",
//                 //                           textAlign: TextAlign.left,
//                 //                           style: TextStyle(
//                 //                               fontWeight: FontWeight.bold
//                 //                           ),
//                 //                         ),
//                 //                         Container(
//                 //                           alignment: Alignment.centerRight,
//                 //                           child: Row(
//                 //                             children: [
//                 //                               IconButton(icon: Icon(Icons.add), onPressed: () async {
//                 //                                 setState(() {
//                 //                                   _stepCounter ++;
//                 //                                 });
//                 //                               }),
//                 //                               IconButton(icon: Icon(Icons.refresh), onPressed: () async {
//                 //                                 setState(() {
//                 //                                   // ignore: unnecessary_statements
//                 //                                   _stepCounter == 0;
//                 //                                 });
//                 //                               })
//                 //                             ],
//                 //                           ),
//                 //                         ),
//                 //                         Container(
//                 //                           child: Column(
//                 //                             children: [
//                 //                               Text('Steps : '),
//                 //                               Flexible(
//                 //                                 child: ListView.builder(
//                 //                                     shrinkWrap: true,
//                 //                                     itemCount: _stepCounter,
//                 //                                     itemBuilder: (context, index){
//                 //                                       return Container();
//                 //                                       //return _stepRow(index);
//                 //                                     }
//                 //                                 ),
//                 //                               ),
//                 //
//                 //                             ],
//                 //                           ),
//                 //                         )
//                 //                       ],
//                 //                     ),
//                 //                     ElevatedButton(
//                 //
//                 //                       child: Text(
//                 //                         'ADD REMEDY',
//                 //                       ),
//                 //                       style: ElevatedButton.styleFrom(
//                 //                           primary: COLOR_BROWN,
//                 //                           minimumSize: Size(size.width, size.height*0.05),
//                 //                           textStyle: TextStyle(
//                 //                               color: COLOR_BLACK
//                 //                           )
//                 //                       ),
//                 //                       onPressed: () async{
//                 //                         // if(_formKey.currentState!.validate()){
//                 //                         //   _submit();
//                 //                         // }
//                 //
//                 //                       },
//                 //
//                 //                     )
//                 //
//                 //                   ],
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       )
//                 //     ],
//                 //   ),
//                 // )
//
//               ],
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   PageHeadingWidget("ADD NEW REMEDY", Icons.analytics, size.height, size.width)
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                   padding: EdgeInsets.all(16),
//                   child: AddHomeRemedy()
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// }
// // Create a Form widget.
// class AddHomeRemedy extends StatefulWidget {
//   //const AddHomeRemedy({super.key});
//
//   @override
//   AddHomeRemedyState createState() {
//     return AddHomeRemedyState();
//   }
// }
//
// // Create a corresponding State class.
// // This class holds data related to the form.

import 'package:happy_pet/utils/popups/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:happy_pet/model/remedy.dart';
import 'package:happy_pet/screens/happypet/app_myPet/petDetailPage.dart';
import 'package:happy_pet/screens/happypet/app_remedies/startDiagnosticPage.dart';
import 'package:happy_pet/services/api_services/remedy_api_services.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:happy_pet/utils/custom_widgets/appLoader.dart';
import 'package:happy_pet/utils/utility.dart';

class RemedyDetection extends StatefulWidget {
  final imgPath;


  RemedyDetection({Key? key, this.imgPath}) : super(key: key);

  @override
  _RemedyDetectionState createState() => _RemedyDetectionState(imgPath);
}

class _RemedyDetectionState extends State<RemedyDetection> {
  String imagePath;
  _RemedyDetectionState(this.imagePath);
  var _stepFieldController = TextEditingController();

  bool tempValue = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  int _stepCounter = 0;

  List<String> stepList = [];
  String fieldStep = '';
  Remedy newRemedy = new Remedy();

  static const List<String> list = <String>['Hypothyroidism', 'Dandruff', 'Lupus', 'Ringworm', 'Impetigo', 'Yeast Infection', 'Macules'];
  String _dropdownValue = list.first;


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

          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.36, left: size.width * 0.012, right:size.width * 0.012 ),
              child: ListView(
                children: [

                  Row(
                    children: [
                      Text(
                        "Select Disease : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                      SizedBox(width: 30),
                      DropdownButton(
                        value: _dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: ( value) {
                          // This is called when the user selects an item.
                          setState(() {
                            _dropdownValue = value.toString();
                            newRemedy.diseaseName = _dropdownValue;
                          });
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Text(
                    "Enter a Title for your Remedy :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 16
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter a Title for your Remedy',

                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your Remedy Title';
                      }else{
                        newRemedy.remedyTitle = value;
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        newRemedy.remedyTitle = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Enter a Brief about you new Remedy :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter a Brief about your Remedy',
                    ),

                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter a brief about your remedy';
                      }else{
                        newRemedy.remedyBrief = value;
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState(() {
                        newRemedy.remedyBrief = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Enter the Step to follow :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                      IconButton(
                          onPressed: () async{
                            setState(() {
                              stepList.clear();
                            });
                            _stepFieldController.clear();
                          },
                          icon: Icon(Icons.refresh)
                      )
                    ],
                  ),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16
                    ),
                    controller: _stepFieldController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Enter a Remedy Step',
                      suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          if(fieldStep.isNotEmpty){
                            stepList.add(fieldStep);
                            fieldStep = '';
                            newRemedy.remedySteps = stepList;
                          }

                        });
                        _stepFieldController.clear();
                      },
                      icon: Icon(Icons.add_circle),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please Enter your remedy Steps';
                    //   }else{
                    //     steps = value;
                    //   }
                    //   return null;
                    // },
                    onChanged: (value){
                      setState(() => fieldStep = value);
                    },
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: size.width*0.89,
                        height: size.height*0.12 ,
                        child: ListView.builder(
                          itemCount: stepList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                tileColor: Colors.grey[100],
                                dense: true,
                                visualDensity: VisualDensity(vertical: -3),
                                title: Text(
                                  (index + 1).toString() +'. '+ stepList[index],
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
                                      stepList.remove(stepList[index]);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (true) {
                          SmartDialog.showLoading(
                              widget: AppLoader.popupLoader(size));

                          RemedyAPIService remedyApiService = new RemedyAPIService();

                          setState(()=> {
                              // print("Selected Value : " + newRemedy + " " + title + " "+ brief );
                              // remedy = new Remedy(diseaseName, title, brief, stepList);
                              print("Data from model : " +newRemedy.remedyTitle.toString())
                          });
                          Remedy checkedRemedy = await remedyApiService.checkNewRemedyExistence(newRemedy);

                          SmartDialog.dismiss();
                          print(checkedRemedy.remedyTitle);

                          if(checkedRemedy.remedyExist){
                            print("REMEDY EXIST");
                            Dialogs.information(context, "The Remedy You Entered is Already Exist with Happy Pet! ", "The remedy " +checkedRemedy.remedyTitle + " is Already Exist with out records. "+checkedRemedy.analyseMessage, 0
                            );


                          }else{
                            print("REMEDY NOT EXIST");
                            Dialogs.information(context, "You shared a new Remedy", checkedRemedy.analyseMessage, 2);
                            // Navigator.of(context).pop();

                          }

                          // showDialog(
                          //     context: context,
                          //     builder: (context) => AlertDialog(
                          //         content: Text(
                          //             checkedRemedy.analyseMessage
                          //         ),
                          //         actions: [
                          //           TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
                          //         ]
                          //     )
                          // );
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('ADD REMEDY'),
                    ),
                  ),


                ],
              ),
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
                              gradient: customHeaderLinearGradient(COLOR_BROWN, COLOR_WHITE),
                            ),
                            child: Text('Add Your Remedy :',
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

// class AddHomeRemedyState extends State<RemedyDetection> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<AddHomeRemedyState>.
//   final _formKey = GlobalKey<FormState>();
//   int _stepCounter = 0;
//   late Remedy newRemedy;
//   String diseaseName = '';
//   String title = "";
//   String brief = "";
//   String steps = "";
//
//   static const List<String> list = <String>['Hypothyroidism', 'Dandruff', 'Lupus', 'Ringworm', 'Impetigo', 'Yeast Infection', 'Macules'];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     String dropdownValue = list.first;
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//
//             Row(
//               children: [
//                 Text(
//                   "Select Disease : ",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15
//                   ),
//                 ),
//                 SizedBox(width: 30),
//                 DropdownButton<String>(
//                   value: dropdownValue,
//                   icon: const Icon(Icons.arrow_downward),
//                   elevation: 16,
//                   style: const TextStyle(color: Colors.deepPurple),
//                   underline: Container(
//                     height: 2,
//                     color: Colors.deepPurpleAccent,
//                   ),
//                   onChanged: (String? value) {
//                     // This is called when the user selects an item.
//                     setState(() {
//                       dropdownValue = value!;
//                       diseaseName = dropdownValue;
//                     });
//                   },
//                   items: list.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//             Text(
//               "Enter a Title for your Remedy :",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15
//               ),
//             ),
//             TextFormField(
//
//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please Enter your Remedy Title';
//                 }else{
//                   title = value;
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Enter a Brief about you new Remedy :",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15
//               ),
//             ),
//             TextFormField(
//
//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please Enter a brief about your remedy';
//                 }else{
//                   brief = value;
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 Text(
//                   "Enter the Step to follow :",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () async{
//                       setState(() {
//                         _stepCounter ++;
//                         print(_stepCounter);
//                       });
//                     },
//                     icon: Icon(Icons.add)
//                 ),
//                 IconButton(
//                     onPressed: () async{
//                       setState(() {
//                         _stepCounter = 0;
//                         print(_stepCounter);
//                       });
//                     },
//                     icon: Icon(Icons.refresh)
//                 )
//               ],
//             ),
//             TextFormField(
//               keyboardType: TextInputType.multiline,
//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please Enter your remedy Steps';
//                 }else{
//                   steps = value;
//                 }
//                 return null;
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   // Validate returns true if the form is valid, or false otherwise.
//                   if (_formKey.currentState!.validate()) {
//
//                     RemedyAPIService remedyApiService = new RemedyAPIService();
//
//                     var analyzeResponse = await remedyApiService.analyzeNewRemedy(new Remedy(diseaseName, title, brief, Utility.covertParagraphToArray(steps)));
//                     print(analyzeResponse);
//
//                     if(analyzeResponse.remedyExistence){
//                       print("REMEDY EXIST");
//
//                     }else{
//                       print("REMEDY NOT EXIST");
//                     }
//
//                     showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                             content: Text(
//                                 analyzeResponse.analyseMessage
//                             ),
//                             actions: [
//                               TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
//                             ]
//                         )
//                     );
//                     // If the form is valid, display a snackbar. In the real world,
//                     // you'd often call a server or save the information in a database.
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing Data')),
//                     );
//                   }
//                 },
//                 child: const Text('ADD REMEDY'),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }


_row(int index){
  return Row(
    children: [
      Text('ID : $index'),
      SizedBox(width: 30.0),
      Expanded(child: TextFormField())
    ],
  );
}