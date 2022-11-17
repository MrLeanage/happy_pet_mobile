import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet/services/api_services/authenticate_service.dart';
import 'package:happy_pet/services/data_services/firebase_user_profile_service.dart';
import 'package:happy_pet/utils/constants.dart';
import 'package:happy_pet/utils/custom_widgets/FormField.dart';
import 'package:happy_pet/utils/custom_widgets/addSpace_widget.dart';
import 'package:happy_pet/utils/custom_widgets/loader_widget.dart';
import 'package:happy_pet/utils/custom_widgets/toastMessage.dart';
import 'package:happy_pet/utils/popups/dialogs.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  final VoidCallback onClickedLogin;

  const SignUpScreen({
    Key? key,
    required this.onClickedLogin,
  }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthenticateService _authenticateService = AuthenticateService();
  bool isLoading = false;

  //form field states
  String name = '';
  String email = '';
  String password = '';
  String registerError = '';

  TextEditingController _passwordController = new TextEditingController();
  void _submit() async{
    setState(() => isLoading = true) ;
    if(_formKey.currentState!.validate()){
      dynamic result = await _authenticateService.registerWithEmailAndPassword(email, password);
      if(result.toString().contains('already in use by another account')){
        setState(() => registerError = 'The email address is already in use by another account');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  isLoading ? Loader() : Scaffold(
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
                          decoration: customInputDecoration('ENTER YOUR NAME', size, Icons.account_box),
                          keyboardType: TextInputType.text,
                          validator: (value) =>
                          value!.isEmpty && !EmailValidator.validate(name)
                              ? 'Enter your full Name'
                              : null,
                          onChanged: (value){
                            setState(() => name = value);
                          },
                        ),
                        // password Field
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          decoration: customInputDecoration('ENTER YOUR EMAIL', size, Icons.email),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                          value!.isEmpty && !EmailValidator.validate(email)
                              ? 'Enter a valid Email'
                              : null,
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
                              return 'Enter min. 6 characters';
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
                              return 'Passwords does not match !';
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
                              signUp();
                            }

                          },

                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black, fontSize: 15),
                                text: 'Already have an account? ',
                                children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = widget.onClickedLogin,
                                      text: "Log In",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue,
                                        fontSize: 16
                                      )
                                  ),
                                ]
                            )),

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
  Future signUp() async {
    setState(() => isLoading = true);
    try{
      dynamic result = await _authenticateService.registerWithEmailAndPassword(email, password);
      if(result.toString().contains('already in use by another account')){
        setState(() => registerError = 'The email address is already in use by another account');
      }else{
        // FirebaseUserProfileService firebaseUserProfileService = new FirebaseUserProfileService();
        // await firebaseUserProfileService.createUserProfile(userName: name, userEmail: email);

        // Dialogs.information(context, "Successful", "User Account Created Successfully!..", 1);
      }
    } catch(exception){
      ToastMessage.showErrorToast("Error Occurred while sign in, Please try again !..");
      print(exception);
    }
    setState(() => isLoading = false);

  }
}
