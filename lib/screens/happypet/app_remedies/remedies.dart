// import 'package:flutter/material.dart';
// import 'package:kf_drawer/kf_drawer.dart';
//
// class Remedies extends KFDrawerContent {
//   Remedies({
//     Key? key,
//   });
//
//   @override
//   _RemediesState createState() => _RemediesState();
// }
//
// class _RemediesState extends State<Remedies> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Center(
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                   child: Material(
//                     shadowColor: Colors.transparent,
//                     color: Colors.transparent,
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.menu,
//                         color: Colors.black,
//                       ),
//                       onPressed: widget.onMenuPressed,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text('Remedies'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/app_myPet/petDetailPage.dart';
import 'package:happy_pet/screens/happypet/app_remedies/remedyDetailPage.dart';
import 'package:happy_pet/screens/happypet/remedy_detection/Remedy_Detetction.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Remedies extends KFDrawerContent {
  Remedies({
    Key? key,
  });

  @override
  _RemediesState createState() => _RemediesState();
}

class _RemediesState extends State<Remedies> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: widget.onMenuPressed,
                      ),
                    ),
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
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[



                        Image.asset(
                          APP_LOGO_COVER_PATH,
                          width: size.width * 0.90,
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Text("WELCOME TO HAPPY PET HOME REMEDIES", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black)),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.amber[100],
                      child: Image.asset(
                        'assets/app/home-remedy-cover.jpg',
                        width: size.width * 0.90,
                      )
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.amber[100],
                      child: Text("HAPPY PET is the smart app that support users to have A traditional therapy often utilizing natural products, nutritional supplements, or physical measures. Its effectiveness may be supported by familial, local, or culturally accepted stories or rituals."
                        , style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      width: size.width ,
                      decoration: BoxDecoration(
                        gradient: customHeaderLinearGradient(COLOR_BROWN, COLOR_WHITE),
                      ),
                      child: Row(
                        children: [
                          Text("Add Your Remedy", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(width: size.width * 0.125,),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RemedyDetection(imgPath: 'assets/app/home-remedy-cover.jpg')
                              // builder: (context) => ObservationDetection()
                              ))
                              },
                              child: Wrap(children : [
                                Icon(
                                  Icons.add_circle,
                                  color: COLOR_WHITE,
                                  size: 20,
                                ),
                                SizedBox(width: 10,),
                                Text('ADD', style: TextStyle(fontSize: 18),),
                              ],),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    Container(
                        height: 300,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            listItem('assets/app/home-remedy-cover.jpg', 'Remedy for Acne', 'Rahul', size),
                            new SizedBox(width: 15),
                            listItem('assets/app/home-remedy-cover.jpg', 'Remedy for Lupus', 'James', size),
                            new SizedBox(width: 15),
                            listItem('assets/app/home-remedy-cover.jpg', 'Remedy for Ringworm', 'Arnold', size),
                          ],
                        )
                    ),
                    SizedBox(height: 15),
                    // Text("Stats", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 200,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(40),
              //       topRight: Radius.circular(40),
              //     ),
              //     color: Colors.brown,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: <Widget>[
              //       // Container(
              //       //   width: size.width * 0.35,
              //       //   height: size.width * 0.35,
              //       //   color: Colors.white,
              //       //
              //       // ),
              //       // SizedBox(width: 10,),
              //       // Container(
              //       //   width: size.width * 0.35,
              //       //   height: size.width * 0.35,
              //       //   color: Colors.white,
              //       // )
              //       listItemStats(APP_AIR_CONDITIONER_PATH,"Air Conditioner", true),
              //       listItemStats(APP_WASHING_MACHINE_PATH,"Washing Machine", true)
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listItem(String imgPath, String title, String publisher, Size size){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RemedyDetailPage(
              imgPath: 'assets/app/home-remedy-cover.jpg',
            )));
      },
      child: Container(
        width: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // border: Border.all(color: COLOR_BROWN),
            color: Colors.grey[300]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width:  size.width * 0.5,
              // color: Colors.white,
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.amber[300],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft : Radius.circular(10))
              ),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            Container(
              // color: Colors.white,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft : Radius.circular(10))
              ),
              child: Row(
                children: [
                  Text(
                    'by ' + publisher,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),

                ],
              ),
            ),
            // SizedBox(height: 5,),
            Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(imgPath),
                      fit: BoxFit.cover
                  ),
                )
            ),
            Container(
              width: size.width * 0.8,
              padding: EdgeInsets.only(left: 5, top: 2, bottom: 2, right: 5),
              color: Colors.orange[100],
              child: customRatingBar(1, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItemStats(String imgPath, String name, bool value){
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Image(image: AssetImage(imgPath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
          SizedBox(height: 15),
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
