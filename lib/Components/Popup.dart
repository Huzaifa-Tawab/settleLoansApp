import 'package:flutter/material.dart';
import 'package:settle_loans/Constrains/colors.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 100, vertical: 300),
        color: PrimaryColor(),
        height: 280,
        width: 265,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/CheckCircle.png'),
            // SizedBox(
            //   height: 20,
            // ),
            Text(
                'Thank you for booking\n you will hear from our\n execuitive shortly'),
          ],
        ),
      ),
    );
  }
}
