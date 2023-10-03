import 'package:flutter/material.dart';
import 'package:settle_loans/Constrains/colors.dart';

class Popup extends StatelessWidget {
  const Popup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 250),
      height: 400,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/CheckCircle.png'),
          SizedBox(
            height: 10,
          ),
          Divider(
            endIndent: 20,
            indent: 20,
          ),
          Text(
              'Thank you for booking\n you will hear from our\n execuitive shortly'),
        ],
      ),
    );
  }
}
