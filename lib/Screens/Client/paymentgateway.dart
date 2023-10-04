import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settle_loans/Components/icons.dart';
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
        toolbarHeight: 130,
        backgroundColor: Color(0xff000001C),
        foregroundColor: const Color(0xFFFFFFFF) ,
        
        title: 
          Text("Settleloans",style: TextStyle(

             
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
          width: 170,
          child: TextButton(
            
            
             onPressed: () {
              showDataAlert(context);
             },
     
           child: Text("Pay Now", style: TextStyle(
          color: const Color(0xFF232323),
          fontSize: 16,
          fontFamily: GoogleFonts.rubik().fontFamily,
          fontWeight: FontWeight.w600,
          height: 1.60,
        ),), style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFFFDC60),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFF488AD2)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),))
        ],
      ),),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cards, UPI & More",style: HeadingTextStyle1(),),
            SizedBox(height: 20,),
            Containerbutton(img: creditcard,text: "Card",text2: "Visa, Mastercard, RuPay", onPressed: (){}),
            Containerbutton(img:Iconwallet,text: "NetBanking",text2: "All Indian banks", onPressed: (){}),
            Containerbutton(img: Iconwallet,text: "Wallet",text2: "PhonePe & More", onPressed: (){}),
          ],
        ),
      ),
    );
  }
}


class Containerbutton extends StatelessWidget {
  final String text;
  final String text2;
  final Function onPressed;
  Widget img;

   Containerbutton(
      {super.key, required this.text, required this.img,required this.text2, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child: Container(
        margin: EdgeInsets.all(5),
        height: 100,
      width:MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration( border: Border.all(),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,width: 50,
          child: img,)
          
          ,
          SizedBox(width: 10,),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,style: HeadingTextStyle2(),),
          Text(text2,style: ParaTextStyle1(),
          )
          ],
          )
          ],
          ),
      
      ),
    );
  }
}

showDataAlert(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
         
          content: 
           Container(
            height: 250,
            width: 200,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset('assets/CheckCircle.png'),
                 // SizedBox(
                 //   height: 10,
                 // ),
                 Divider(
                  thickness: 2,
                   endIndent: 45,
                   indent: 45,
                 ),
                 Text(
                     'Thank you for booking\n you will hear from our\n execuitive shortly'),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                      ),
               ],
             ),
           ),
           
          
        );
      });
}