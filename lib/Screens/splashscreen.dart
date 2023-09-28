import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:settle_loans/Components/shared_prefs.dart';
import 'package:settle_loans/Screens/Auth/login.dart';
import 'package:settle_loans/Screens/Auth/signup.dart';
import 'package:settle_loans/Screens/Client/client_home.dart';
import '/Screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool newInstall = true;
    getBool('newInstall').then(
      (value) {
        if (value == null || value == true) {
          newInstall = true;
          putBool('newInstall', false);
        } else {
          newInstall = false;
        }
      },
    );

    Timer(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ClientHome()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                newInstall ? OnBoardingScreen() : SignupScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
