import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_final/Screens/home_screen.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/colors_utils.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Reset Password",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
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
                  reusableTextField("Enter email", Icons.person_outlined, false, _emailTextController),
                  const SizedBox(height: 20),
                  firebaseUIButton(context, "Reset Password", (){
                   FirebaseAuth.instance
                       .sendPasswordResetEmail(email: _emailTextController.text)
                       .then((value) => Navigator.of(context).pop());
                  })

                ],
              ),
            ),
            )));
  }
}
