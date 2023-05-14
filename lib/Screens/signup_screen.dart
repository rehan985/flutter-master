import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Screens/home_screen.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/colors_utils.dart';
class SignUp_screen extends StatefulWidget {
  const SignUp_screen({Key? key}) : super(key: key);

  @override
  State<SignUp_screen> createState() => _SignUp_screenState();
}

class _SignUp_screenState extends State<SignUp_screen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _userTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("SignUp",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Container(
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
    children:<Widget> [
     const SizedBox(height: 20),
      reusableTextField("Enter UserName", Icons.person_outlined, false, _userTextController),
      const SizedBox(height: 20),
      reusableTextField("Enter Email", Icons.person_outlined, false, _emailTextController),
      const  SizedBox(height: 20),
      reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
      firebaseUIButton(context, "Sign Up", () {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
            .then((value) {
          print("Created New Account");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
        }).onError((error, stackTrace) {
          print("Error ${error.toString()}");
        });
      })
    ],
    ),
    ),
    )));
  }
}
