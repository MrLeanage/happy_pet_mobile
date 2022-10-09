import 'dart:ui';

import 'package:happy_pet/model/remedy.dart';
import 'package:happy_pet/model/remedyAnalyse.dart';
import 'package:happy_pet/services/api_services/remedy_api_services.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
import 'package:happy_pet/utils/custom_widgets/appBar.dart';
import 'package:happy_pet/utils/custom_widgets/pageHeading_widget.dart';
import 'package:happy_pet/utils/custom_widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/utils/utility.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RemedyDetection extends StatefulWidget {
  @override
  _RemedyDetectionState createState() => _RemedyDetectionState();
}

class _RemedyDetectionState extends State<RemedyDetection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //form field values
  String diseaseTitle = "";
  String briefIntro = "";
  var remedySteps = [];


  //control variables
  bool loading = false;


  void _submit() async{
    setState(() => loading = true) ;
    // if(_formKey.currentState!.validate()){
    //   //dynamic result = await _authService.registerWithEmailAndPassword(email, password);
    //   //if(result.toString().contains('already in use by another account')){
    //   //  setState(() => registerError = 'The email address is already in use by another account');
    //   //}
    // }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: SideBar(),
      backgroundColor: COLOR_BACKGROUND,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                customAppBar(size.height, size.width, _scaffoldKey),



                // Container(
                //   padding: EdgeInsets.all(16),
                //   child: AddHomeRemedy(),
                // ),
                // addVerticalSpace(size.height),
                // Container(
                //   child: Stack(
                //     children: <Widget>[
                //       Container(
                //         decoration: BoxDecoration(
                //             color: COLOR_GREEN
                //         ),
                //       ),
                //       Center(
                //         child: Card(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10.0)
                //           ),
                //           child: Container(
                //             height: size.height*0.42,
                //             width: 300,
                //             padding: EdgeInsets.all(16),
                //             child: Form(
                //               key: _scaffoldKey,
                //               child: SingleChildScrollView(
                //                 child: Column(
                //                   children: <Widget>[
                //                     // Image.asset('assets/logo-cover.png'),
                //                     //Email Field
                //                     TextFormField(
                //                       decoration: InputDecoration(labelText: 'TITLE'),
                //                       keyboardType: TextInputType.text,
                //                       validator: (value){
                //                         if(value!.isEmpty){
                //                           return 'Give a Title for your remedy!';
                //                         }
                //                         return null;
                //                       },
                //                       onChanged: (value){
                //                         setState(() => diseaseTitle = value);
                //                       },
                //                     ),
                //                     // password Field
                //                     TextFormField(
                //                       decoration: InputDecoration(labelText: 'REMEDY SUMMARY'),
                //                       keyboardType: TextInputType.multiline,
                //                       validator: (value){
                //                         if(value!.isEmpty){
                //                           return 'Please provide a Summary of your remedy steps';
                //                         }
                //                         return null;
                //                       },
                //                     ),
                //                     //Confirm Password
                //                     SizedBox(
                //                       height: 4,
                //                     ),
                //                     Row(
                //                       children: [
                //                         Text(
                //                           "NEW REMEDY STEPS",
                //                           textAlign: TextAlign.left,
                //                           style: TextStyle(
                //                               fontWeight: FontWeight.bold
                //                           ),
                //                         ),
                //                         Container(
                //                           alignment: Alignment.centerRight,
                //                           child: Row(
                //                             children: [
                //                               IconButton(icon: Icon(Icons.add), onPressed: () async {
                //                                 setState(() {
                //                                   _stepCounter ++;
                //                                 });
                //                               }),
                //                               IconButton(icon: Icon(Icons.refresh), onPressed: () async {
                //                                 setState(() {
                //                                   // ignore: unnecessary_statements
                //                                   _stepCounter == 0;
                //                                 });
                //                               })
                //                             ],
                //                           ),
                //                         ),
                //                         Container(
                //                           child: Column(
                //                             children: [
                //                               Text('Steps : '),
                //                               Flexible(
                //                                 child: ListView.builder(
                //                                     shrinkWrap: true,
                //                                     itemCount: _stepCounter,
                //                                     itemBuilder: (context, index){
                //                                       return Container();
                //                                       //return _stepRow(index);
                //                                     }
                //                                 ),
                //                               ),
                //
                //                             ],
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                     ElevatedButton(
                //
                //                       child: Text(
                //                         'ADD REMEDY',
                //                       ),
                //                       style: ElevatedButton.styleFrom(
                //                           primary: COLOR_BROWN,
                //                           minimumSize: Size(size.width, size.height*0.05),
                //                           textStyle: TextStyle(
                //                               color: COLOR_BLACK
                //                           )
                //                       ),
                //                       onPressed: () async{
                //                         // if(_formKey.currentState!.validate()){
                //                         //   _submit();
                //                         // }
                //
                //                       },
                //
                //                     )
                //
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // )

              ],
            ),
            Center(
              child: Column(
                children: [
                  PageHeadingWidget("ADD NEW REMEDY", Icons.analytics, size.height, size.width)
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: AddHomeRemedy()
              ),
            )
          ],
        ),
      ),
    );
  }

}
// Create a Form widget.
class AddHomeRemedy extends StatefulWidget {
  //const AddHomeRemedy({super.key});

  @override
  AddHomeRemedyState createState() {
    return AddHomeRemedyState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AddHomeRemedyState extends State<AddHomeRemedy> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<AddHomeRemedyState>.
  final _formKey = GlobalKey<FormState>();
  int _stepCounter = 0;
  late Remedy newRemedy;
  String diseaseName = '';
  String title = "";
  String brief = "";
  String steps = "";

  static const List<String> list = <String>['Hypothyroidism', 'Dandruff', 'Lupus', 'Ringworm', 'Impetigo', 'Yeast Infection', 'Macules'];



  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

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
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                      diseaseName = dropdownValue;
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

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your Remedy Title';
                }else{
                  title = value;
                }
                return null;
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

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter a brief about your remedy';
                }else{
                  brief = value;
                }
                return null;
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
                        _stepCounter ++;
                        print(_stepCounter);
                      });
                    },
                    icon: Icon(Icons.add)
                ),
                IconButton(
                    onPressed: () async{
                      setState(() {
                        _stepCounter = 0;
                        print(_stepCounter);
                      });
                    },
                    icon: Icon(Icons.refresh)
                )
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your remedy Steps';
                }else{
                  steps = value;
                }
                return null;
              },
            ),
            // ListView(
            //   children: [
            //     Container(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Column(
            //         children: [
            //           Flexible(
            //               child: ListView.builder(
            //                   shrinkWrap: true,
            //                   itemCount: _stepCounter,
            //                   itemBuilder: (context, index){
            //                     //return _row(index);
            //                     return Container();
            //                   }
            //               )
            //           )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {

                    RemedyAPIService remedyApiService = new RemedyAPIService();

                    var analyzeResponse = await remedyApiService.analyzeNewRemedy(new Remedy(diseaseName, title, brief, Utility.covertParagraphToArray(steps)));
                    print(analyzeResponse);

                    if(analyzeResponse.remedyExistence){
                      print("REMEDY EXIST");

                    }else{
                      print("REMEDY NOT EXIST");
                    }

                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            content: Text(
                                analyzeResponse.analyseMessage
                            ),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
                            ]
                        )
                    );
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
    );
  }
}

_row(int index){
  return Row(
    children: [
      Text('ID : $index'),
      SizedBox(width: 30.0),
      Expanded(child: TextFormField())
    ],
  );
}