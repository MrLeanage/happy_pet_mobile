import 'dart:ui';

// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:happy_pet/model/userDetail.dart';
import 'package:happy_pet/screens/happypet/app_home/class_builder.dart';
import 'package:happy_pet/screens/happypet/app_home/AppBase_Screen.dart';
import 'utils/custom_widgets/loader_widget.dart';
import 'screens/wrapper.dart';
import 'package:happy_pet/services/api_services/authenticate_service.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'screens/authenticate/login_screen.dart';
import 'screens/authenticate/signup_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   //await Firebase.initializeApp();
//   runApp(HappyPetApp());
// }

Future main () async {
  ClassBuilder.registerClasses();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(HappyPetApp());
}
class HappyPetApp extends StatefulWidget {
  @override
  _HappyPetAppState createState() => _HappyPetAppState();
}

class _HappyPetAppState extends State<HappyPetApp> {
  double screenWidth = window.physicalSize.width;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Happy Pet',
        theme: ThemeData(primaryColor : COLOR_BROWN, accentColor: COLOR_GREY, textTheme: screenWidth <500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT ),

        home: Wrapper(),
        navigatorObservers: [FlutterSmartDialog.observer],
        // here
        builder: FlutterSmartDialog.init(),
        //Routes
        routes:{
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen()
        }
    );
    // var val = AuthService().user;
    // return StreamProvider (
    //
    //   initialData:  AuthService().authUser,
    //   create: (BuildContext context) {
    //   },
    //   child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //
    //       title: 'Farm Buddy',
    //       theme: ThemeData(primaryColor : COLOR_GREEN, accentColor: COLOR_GREY, textTheme: screenWidth <500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT ),
    //       home: Wrapper(),
    //       //Routes
    //       routes:{
    //         SignupScreen.routeName: (ctx) => SignupScreen(),
    //         LoginScreen.routeName: (ctx) => LoginScreen(),
    //         HomeScreen.routeName: (ctx) => HomeScreen(2)
    //       }
    //   ),
    // );
  }
}
