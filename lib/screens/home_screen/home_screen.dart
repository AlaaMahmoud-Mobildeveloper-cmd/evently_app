import 'package:evently_app/core/firebase_functions.dart';
import 'package:evently_app/screens/authntaction_screens/sign_upScreen/signUpScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("home"),
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        FirebaseFunction.signOut().then((value) => Navigator.pushReplacementNamed(context, SignUpScreen.routeName));
      }, child: Text("sign out"))),
    );
  }
}
