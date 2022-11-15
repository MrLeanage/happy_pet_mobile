import 'package:flutter/material.dart';
import 'package:happy_pet/screens/happypet/app_home/AppBase_Screen.dart';
import 'package:happy_pet/services/api_services/authenticate_service.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';

import '../../utils/custom_widgets/loader_widget.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthService _authService = AuthService();

  bool loading = false;

  //form field states
  String email = '';
  String password = '';
  String loginError = '';

  void _submit() async{
    print("Email :" + email);
    print("Password :" + password);
    setState(() => loading = true);

    await Future.delayed(Duration(seconds: 10));
    setState(() => loading = false);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomeScreen();
    }));

    // dynamic result = await _authService.signInWithEmailAndPassword(email, password);
    // if(result == null){
    //   setState(() => loading = false);
    //   setState(() => loginError = 'Please check your Internet Connection');
    // }
    // if(result.toString().contains('no user record corresponding')){
    //   setState(() => loading = false);
    //   setState(() => loginError = 'Invalid Email, Please Sign Up!');
    // }
    // if(result.toString().contains('password is invalid')){
    //   setState(() => loading = false);
    //   setState(() => loginError = 'Invalid Password!');
    // }

  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return loading ? Loader() : Scaffold(

      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // gradient:LinearGradient(
              //     colors: [
              //       COLOR_BROWN,
              //       COLOR_BROWN_LIGHT1
              //     ],
              //     begin: const FractionalOffset(0.4, 0.0),
              //     end: const FractionalOffset(1.0, 0.0),
              //     stops: [0.0, 1.0],
              //     tileMode: TileMode.clamp),
              image: DecorationImage(
                image: AssetImage(APP_BACKGROUND_PATH),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
              ),
              color: Colors.white.withOpacity(0.9),
              child: Container(

                height: 400,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child:
                    Column(
                      children: <Widget>[
                        Image.asset(APP_LOGO_COVER_PATH),
                        //Email Field
                        TextFormField(
                          decoration: customInputDecoration('ENTER YOUR EMAIL', size, Icons.email),

                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty || !value.contains('@')){
                              return 'Invalid Email';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() => email = value);
                          },
                        ),
                        SizedBox(height: 12.0,),
                        // password Field
                        TextFormField(
                          decoration: customInputDecoration('ENTER YOUR PASSWORD', size, Icons.lock),
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty || value.length <= 5){
                              return 'Invalid Password';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() => password = value);
                          },
                        ),

                        Text(
                          loginError,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                       SizedBox(
                         height: 20,
                       ),
                       ElevatedButton(

                         child: Text(
                           'LOGIN',
                         ),
                         style: ElevatedButton.styleFrom(
                          primary: COLOR_BROWN,
                           minimumSize: Size(size.width, size.height*0.05),
                           textStyle: TextStyle(
                             color: COLOR_BLACK
                           )
                         ),
                         onPressed: () async{
                           if(_formKey.currentState!.validate()){
                             _submit();
                           }

                         },

                       ),
                        Row(
                          children: [
                            Text(
                              'New User? Sign Up Now'
                            ),
                            addHorizontalSpace(5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: COLOR_GREEN
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                  ),
                                  Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.017

                                      )
                                  )
                                ],
                              ),
                              onPressed: () async{
                                Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);

                              },

                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
