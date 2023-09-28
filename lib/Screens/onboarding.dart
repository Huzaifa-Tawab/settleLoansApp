import 'package:flutter/material.dart';
import '/Components/icons.dart';
import '/Constrains/Buttons.dart';
import '/Constrains/colors.dart';
import '/Constrains/textstyles.dart';
import '/Screens/Auth/login.dart';
import '/Screens/Auth/signup.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  bool goto_nextPage = false;
  final onboardings = <Widget>[
    Onboarding1(),
    Onboarding2(),
    Onboarding3(),
  ];
  incrementhandler() {
    if (index == 2) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignupScreen()),
          (Route<dynamic> route) => false);
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: LogoBlack,
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width, child: onboardings[index]),
      bottomSheet: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 80),
        color: bg_Yellow,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          height: 60,
          child: RoundedButton1(
            text: index == 2 ? 'Login' : 'Next',
            onPressed: incrementhandler,
          ),
        ),
      ),
    );
  }
}

Widget Onboarding1() {
  return Column(
    children: [
      SizedBox(
        height: 80,
      ),
      Image(
        image: AssetImage('assets/onboarding1.png'),
        height: 220,
        width: 220,
      ),
      SizedBox(
        height: 50,
      ),
      Text('Tag line 1',
          textAlign: TextAlign.center, style: HeadingTextStyle1()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
            'Settle Loans swiftly stops bank harassment and initiates legal proceedings\nwithin 24 hours.',
            textAlign: TextAlign.center,
            style: ParaTextStyle1()),
      ),
    ],
  );
}

Widget Onboarding2() {
  return Column(
    children: [
      SizedBox(
        height: 80,
      ),
      Image(
        image: AssetImage('assets/onboarding1.png'),
        height: 220,
        width: 220,
      ),
      SizedBox(
        height: 50,
      ),
      Text('Tag line 2',
          textAlign: TextAlign.center, style: HeadingTextStyle1()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
            'Settle Loans swiftly stops bank harassment and initiates legal proceedings\nwithin 24 hours.',
            textAlign: TextAlign.center,
            style: ParaTextStyle1()),
      ),
    ],
  );
}

Widget Onboarding3() {
  return Column(
    children: [
      SizedBox(
        height: 80,
      ),
      Image(
        image: AssetImage('assets/onboarding1.png'),
        height: 220,
        width: 220,
      ),
      SizedBox(
        height: 50,
      ),
      Text('Tag line 3',
          textAlign: TextAlign.center, style: HeadingTextStyle1()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
            'Settle Loans swiftly stops bank harassment and initiates legal proceedings\nwithin 24 hours.',
            textAlign: TextAlign.center,
            style: ParaTextStyle1()),
      ),
    ],
  );
}
