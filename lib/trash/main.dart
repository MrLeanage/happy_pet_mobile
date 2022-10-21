import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/trash/profile.dart';
import 'package:happy_pet/screens/happypet/app_home/class_builder.dart';
import 'package:happy_pet/screens/happypet/app_home/home.dart';
import 'package:happy_pet/screens/happypet/app_remedies/remedies.dart';
import 'package:happy_pet/trash/settings.dart';
import 'package:happy_pet/screens/happypet/app_myPet/myPets.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:kf_drawer/kf_drawer.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;
  
  double drawerItemHeight = 60;
  double drawerItemWidth = 300;
  double drawerItemOpacity = 0.6;
  double drawerItemBorderRadius = 10;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(

      initialPage: ClassBuilder.fromString('Home'),

      items: [
        KFDrawerItem.initWithPage(
          // text: Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
          text: Container(
            width: drawerItemWidth,
            height: drawerItemHeight,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(drawerItemBorderRadius)),
                color: Colors.black.withOpacity(drawerItemOpacity)
            ),
            child: Row(
              children: [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 10,),
                Container(
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          // text: Text(
          //   'Profile',
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // ),
          text: Container(
            width: drawerItemWidth,
            height: drawerItemHeight,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(drawerItemOpacity),
              borderRadius: BorderRadius.all(Radius.circular(drawerItemBorderRadius)),
            ),
            child: Row(
              children: [
                Icon(Icons.account_box, color: Colors.white),
                SizedBox(width: 10,),
                Container(
                  child: Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // icon: Icon(Icons.account_box, color: Colors.white),
          page: Profile(),
        ),
        KFDrawerItem.initWithPage(
          // text: Text(
          //   'Notifications',
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // ),
          text: Container(
            width: drawerItemWidth,
            height: drawerItemHeight,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(drawerItemOpacity),
              borderRadius: BorderRadius.all(Radius.circular(drawerItemBorderRadius)),
            ),
            child: Row(
              children: [
                Icon(Icons.notifications_active, color: Colors.white),
                SizedBox(width: 10,),
                Container(
                  child: Text(
                    'Notifications',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // icon: Icon(Icons.notifications_active, color: Colors.white),
          page: ClassBuilder.fromString('Notifications'),
        ),
        KFDrawerItem.initWithPage(
          // text: Text(
          //   'Stats',
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // ),
          text: Container(
            width: drawerItemWidth,
            height: drawerItemHeight,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(drawerItemOpacity),
              borderRadius: BorderRadius.all(Radius.circular(drawerItemBorderRadius)),
            ),
            child: Row(
              children: [
                Icon(Icons.trending_up, color: Colors.white),
                SizedBox(width: 10,),
                Container(
                  child: Text(
                    'Stats',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // icon: Icon(Icons.trending_up, color: Colors.white),
          page: MyPets(),
        ),
        KFDrawerItem.initWithPage(
          // text: Text(
          //   'Schedules',
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // ),
          text: Container(
            width: drawerItemWidth,
            height: drawerItemHeight,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(drawerItemOpacity),
              borderRadius: BorderRadius.all(Radius.circular(drawerItemBorderRadius)),
            ),
            child: Row(
              children: [
                Icon(Icons.av_timer, color: Colors.white),
                SizedBox(width: 10,),
                Container(
                  child: Text(
                    'Schedules',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // icon: Icon(Icons.av_timer, color: Colors.white),
          page: Remedies(),
        ),
        // KFDrawerItem.initWithPage(
        //
        //   text: Text(
        //     'Settings',
        //     style: TextStyle(color: Colors.white, fontSize: 18, backgroundColor: Colors.black),
        //   ),
        //   icon: Icon(Icons.settings, color: Colors.white),
        //   page: Settings(),
        // ),
        KFDrawerItem.initWithPage(

          text: Container(
            width: drawerItemWidth,
            height: drawerItemHeight,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(drawerItemOpacity),
              borderRadius: BorderRadius.all(Radius.circular(drawerItemBorderRadius)),
            ),
            child: Row(
              children: [
                Icon(Icons.settings, color: Colors.white),
                SizedBox(width: 10,),
                Container(
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // icon: Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),

      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(drawerItemOpacity)
            ),
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(

                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(USER_IMAGE_PATH),
                        fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Scarlett Johansson', style: new TextStyle(fontSize: 17, color: Colors.white)),
                    new SizedBox(height: 2),
                    new Text('Actress', style: new TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Container(
          width: drawerItemWidth,
          height: drawerItemHeight,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(drawerItemOpacity),
            borderRadius: BorderRadius.all(Radius.circular(drawerItemBorderRadius)),
          ),
          child: Row(
            children: [
              Icon(Icons.settings, color: Colors.white),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        ),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   // colors: [Color.fromRGBO(31, 58, 47, 1.0), Color.fromRGBO(31, 58, 47, 1.0)],
          //   colors: [Colors.brown, Colors.black54],
          //   tileMode: TileMode.repeated,
          // ),
          image: DecorationImage(
            image: AssetImage(APP_BACKGROUND_PATH),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
      ),
    );
  }
}



