import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/app_myPet/petDetailPage.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Home extends KFDrawerContent {
  Home({
    Key? key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
                    Text("WELCOME TO HAPPY PET", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black)),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.amber[100],
                      child: Text("HAPPY PET is the smart app that can be used to detect the pet's skin diseases and present the high recommended home remedies as the treatment methods for each detected diseases with very high accuracy by going through the verification processes and predictions with modern ICT technologies"
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
                        gradient: customHeaderLinearGradient(Colors.blue, COLOR_WHITE),
                      ),
                      child: Row(
                        children: [
                          Text("MY PETS", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(width: size.width * 0.33,),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              onPressed: () => print('Edit Clicked'),
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
                          listItem('assets/user/sheeba.jpg', 'Sheeba'),
                          new SizedBox(width: 15),
                          listItem('assets/user/toby.jpg', 'Toby'),
                          new SizedBox(width: 15),
                          listItem('assets/user/roxy.jpg', 'Roxy'),
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

  Widget listItem(String imgPath, String title){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PetDetailPage(
                imgPath: 'assets/user/sheeba.jpg',
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
          children: [
            Container(
              // color: Colors.white,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.amber[300],
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft : Radius.circular(10))
              ),
              child: Row(
                children: [
                  Text(
                      title,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(imgPath),
                      fit: BoxFit.cover
                  ),
                )
            )
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
