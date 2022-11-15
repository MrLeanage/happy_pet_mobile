import 'package:flutter/material.dart';
import 'package:happy_pet/services/api_services/authenticate_service.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthService _authService = AuthService();
  bool loading = false;

  //form field states
  String email = '';
  String password = '';
  String registerError = '';

  TextEditingController _passwordController = new TextEditingController();
  void _submit() async{
    setState(() => loading = true) ;
    if(_formKey.currentState!.validate()){
      dynamic result = await _authService.registerWithEmailAndPassword(email, password);
      if(result.toString().contains('already in use by another account')){
        setState(() => registerError = 'The email address is already in use by another account');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            //   gradient:LinearGradient(
            //       colors: [
            //         COLOR_BROWN,
            //         COLOR_BROWN_LIGHT1
            //       ],
            //       begin: const FractionalOffset(0.4, 0.0),
            //       end: const FractionalOffset(1.0, 0.0),
            //       stops: [0.0, 1.0],
            //       tileMode: TileMode.clamp),
              image: DecorationImage(
                image: AssetImage(APP_BACKGROUND_PATH),
                fit: BoxFit.cover,
              ),
            ),

          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white.withOpacity(0.9),
              child: Container(
                height: size.height*0.72,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
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
                        // password Field
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          decoration: customInputDecoration('ENTER YOUR PASSWORD', size, Icons.lock),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value){
                            if(value!.isEmpty || value.length <= 5){
                              return 'Invalid Password';
                            }
                            return null;
                          },
                        ),
                        //Confirm Password
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          decoration: customInputDecoration('CONFIRM YOUR PASSWORD', size, Icons.lock),
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty || value != _passwordController.text){
                              return 'Invalid Password';
                            }
                            return null;
                          },
                          onChanged: (value){
                            setState(() => password = value);
                          },
                        ),
                        SizedBox(height: 12.0,),
                        Text(
                          registerError,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(

                          child: Text(
                            'SIGN UP',
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
                                'Already Signed Up? Click'
                            ),
                            addHorizontalSpace(20),
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
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,

                                      )
                                  )
                                ],
                              ),
                              onPressed: () async{
                                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

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
