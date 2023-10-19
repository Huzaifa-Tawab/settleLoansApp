import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Components/icons.dart';
import '/Components/shared_prefs.dart';
import '/Screens/Auth/login.dart';
import '/Screens/Client/client_data.dart';
import '/Screens/Client/client_home.dart';

import '/Constrains/Buttons.dart';
import '/Constrains/colors.dart';
import '/Constrains/textfields.dart';
import '/Constrains/textstyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final db = FirebaseFirestore.instance;
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

//  SignUp  with Email Ad Password
  signUpHandler() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _EmailController.text.trim(),
        password: _PasswordController.text.trim(),
      )
          .then((value) {
        putBool('profileComplete', false);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ClientDataScreen1(),
            ),
            (Route<dynamic> route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

// Signup with Google

  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => {ConnectToDb(value)});
    } on PlatformException catch (e) {
      print('Platform Exception');
      print(e);
    } catch (e) {
      print('Catch Exception');
      print(e);
    }
  }

  ConnectToDb(value) {
    db.collection('userDetails').doc(value.user?.uid).get().then((doc) {
      if (doc.data() == null) {
        putBool('profileComplete', false);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ClientDataScreen1(),
            ),
            (Route<dynamic> route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => ClientHome(),
            ),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign up to get a consultation',
                  style: HeadingTextStyle1(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ButtonWithIcon(
                  leading: Container(
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: IconGoogle,
                  ),
                  text: 'Sign up with Google',
                  centerTitle: true,
                  onPressed: signInWithGoogle),
              SizedBox(
                height: 30,
              ),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                      endIndent: 5,
                    )),
                    Text("OR"),
                    Expanded(
                        child: Divider(
                      indent: 5,
                    )),
                  ]),
              TextField_1(
                controller: _EmailController,
                txttype: TextInputType.emailAddress,
                label: 'Email',
              ),
              const SizedBox(
                height: 35,
              ),
              TextField_1(
                controller: _PasswordController,
                txttype: TextInputType.visiblePassword,
                label: 'Password ',
                obscure: true,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Color(0xFF636363),
                      fontSize: 16,
                      fontFamily: GoogleFonts.rubik().fontFamily,
                      fontWeight: FontWeight.w500,
                      height: 0.10,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color(0xFF4285F4),
                        fontSize: 16,
                        fontFamily: GoogleFonts.rubik().fontFamily,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        height: 0.10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
                color: bg_Yellow,
                width: MediaQuery.of(context).size.width,
                child: SizedBox(
                  height: 60,
                  child: RoundedButton1(
                    text: 'Sign Up',
                    onPressed: signUpHandler,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
