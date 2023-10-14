// ignore_for_file: must_be_immutable, unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settle_loans/Components/icons.dart';
import 'package:settle_loans/Constrains/Buttons.dart';
import 'package:settle_loans/Constrains/textstyles.dart';
import 'package:settle_loans/Screens/Client/client_home.dart';
bool _isCardChecked = false;
bool _isnetBChecked = false;
bool _isWalletChecked = false;
class Paymentgateway extends StatefulWidget {
  const Paymentgateway({super.key});

  @override
  State<Paymentgateway> createState() => _PaymentgatewayState();
}

class _PaymentgatewayState extends State<Paymentgateway> {
  bool ispayactived = false;
   @override
  
  void initState() {
     
    // TODO: implement initState
    super.initState();
    setState(() {
      _isCardChecked = false;
 _isnetBChecked = false;
 _isWalletChecked = false;
    });
  }

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
              setState(() {
               ispayactived? showDataAlert(context):null;

                
              });
              
             },
     
           child: Text("Pay Now", style: TextStyle(
          color: const Color(0xFF232323),
          fontSize: 16,
          fontFamily: GoogleFonts.rubik().fontFamily,
          fontWeight: FontWeight.w600,
          height: 1.60,
        ),), style: TextButton.styleFrom(
        backgroundColor: ispayactived?const Color(0xFFFFDC60):Color.fromARGB(255, 99, 97, 93),
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
            PaymentContainer(img: creditcard,text: "Card",text2: "Visa, Mastercard, RuPay",isChecked: _isCardChecked, ontap: (){
              print("Card");
               setState(() {
                  ispayactived=true;

      _isCardChecked = true;
      _isnetBChecked = false;
      _isWalletChecked=false;
    });
            }),
            PaymentContainer(img:Iconwallet,text: "NetBanking",text2: "All Indian banks",isChecked: _isnetBChecked, ontap: (){
                 print("NetBanking");
                 setState(() {
                  ispayactived=true;
    _isCardChecked = false;
      _isnetBChecked = true;
      _isWalletChecked=false;
    });
            }),
            PaymentContainer(img: Iconwallet,text: "Wallet",text2: "PhonePe & More",isChecked: _isWalletChecked, ontap: (){
                 print("Wallet");
                 setState(() {
  _isCardChecked = false;
                  ispayactived=true;

      _isnetBChecked = false;
      _isWalletChecked=true;
    });
            }),
          ],
        ),
      ),
    );
  }
}


class PaymentContainer extends StatelessWidget {
  final String text;
  final String text2;
  final Function ontap;
  final isChecked;
  Widget img;

   PaymentContainer(
      {super.key, required this.text, required this.img,required this.text2, required this.ontap,required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () {
    ontap();
    
    },
      
      child: 
           Container(
        margin: EdgeInsets.all(5),
        height: 100,
      width:MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration( border: Border.all(),),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
          Row(
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
              ) ,isChecked? Icon(
                Icons.check,
                color: Color.fromARGB(255, 141, 5, 5),
              )
            : SizedBox(),
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
                                      onPressed: () {
                                        // Navigator.pop(context);
                                        Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>ClientHome()),
                                              (route) => false
                                        );
                                        
                                      },
                                      child: const Text('OK'),
                                    ),
                      ),
               ],
             ),
           ),
           
          
        );
      });
}