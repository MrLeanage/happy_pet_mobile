import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/screens/authenticate/authenticate.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

import 'happypet/app_home/AppBase_Screen.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    print('user from wrapper build started');
    final user = Provider.of<User>(context);
    print( user);
    if(user == null){
      print('called wrapper inside');
      return Authenticate();
    }else{
      print('called wrapper inside');
      return HomeScreen(2);
    }
  }
}
