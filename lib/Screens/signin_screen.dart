import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Screens/camera.dart';
import 'package:project_final/Screens/reset_password.dart';
import 'package:project_final/Screens/signup_screen.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/colors_utils.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
      hexStringToColor("CB2B93"),
      hexStringToColor("9546C4"),
      hexStringToColor("5E61F4")
    ],begin: Alignment.center, end: Alignment.bottomCenter
    )),
    child: SingleChildScrollView(child: Padding(padding:EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.2, 20, 0) ,
      child: Column(
        children: <Widget>[

        logoWidget("assets/images/logo1.png"),

          const SizedBox(height: 30),
          reusableTextField("Enter Email", Icons.person_outlined, false, _emailTextController),
          const   SizedBox(height: 15),
          reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
          firebaseUIButton(context, "Sign In", () {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
                .then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => cameraAccess()));
            }).onError((error, stackTrace) {
              print("Error ${error.toString()}");
            });
          }),
          const SizedBox(
            height: 15,
          ),
          forgotPassword(context),
          signUpOption(),


        ],

      ),),),
    ),);
  }
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUp_screen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  Widget forgotPassword(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text("Forgot Password",
        style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()))

      ),
    );
  }
}
