import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        
        title: 
          Text("Settleloans",style: TextStyle(

              color: const Color(0xFF232323),
    fontSize: 22,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.w700,
          )),
        
        centerTitle: true,
        
      ),
      bottomSheet: Container(
        color: Color(0xffFFFCF3
),
        height: 100,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Container(
         
          padding: EdgeInsets.all(2),
          height: 60,
           child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text("₹"+"42",style:TextStyle(color: const Color(0xFF232323),
    fontSize: 22,
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontWeight: FontWeight.w700,)),
               Text("View Details",style: TextStyle( )),
             ],
           ),
         ),
         SizedBox(
          width: 120,
          child: RoundedButton1(text: "Pay Now", onPressed: (){}))
        ],
      ),),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cards, UPI & More",style: HeadingTextStyle1(),),
            SizedBox(height: 20,),
            Containerbutton(icons: Icon(Icons.credit_card_sharp,size: 45,),text: "Card",text2: "Visa, Mastercard, RuPay", onPressed: (){}),
            Containerbutton(icons: Icon(Icons.account_balance,size: 45,),text: "NetBanking",text2: "All Indian banks", onPressed: (){}),
            Containerbutton(icons: Icon(Icons.wallet,size: 45,),text: "Wallet",text2: "PhonePe & More", onPressed: (){}),
          ],
        ),
      ),
    );
  }
}