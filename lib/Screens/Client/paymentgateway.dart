import 'package:flutter/material.dart';
import 'package:settle_loans/Constrains/Buttons.dart';
import 'package:settle_loans/Constrains/textstyles.dart';

class Paymentgateway extends StatefulWidget {
  const Paymentgateway({super.key});

  @override
  State<Paymentgateway> createState() => _PaymentgatewayState();
}

class _PaymentgatewayState extends State<Paymentgateway> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settleloans",style: HeadingTextStyle1()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cards, UPI & More",style: HeadingTextStyle1(),),
            SizedBox(height: 20,),
            Containerbutton(icons: Icon(Icons.abc),text: "Card",text2: "Visa, Mastercard, RuPay", onPressed: (){}),
            Containerbutton(icons: Icon(Icons.abc),text: "NetBanking",text2: "All Indian banks", onPressed: (){}),
            Containerbutton(icons: Icon(Icons.abc),text: "Wallet",text2: "PhonePe & More", onPressed: (){}),
          ],
        ),
      ),
    );
  }
}