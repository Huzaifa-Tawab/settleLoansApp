import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Components/icons.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Color(0xff000001C),
        foregroundColor: const Color(0xFFFFFFFF),
        title: Text("Settleloans",
            style: TextStyle(
              fontSize: 22,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/Legalhelp.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "In your appointment, SettleLoans will determine the appropriate monthly payment amount, and if you decide to join with us, we'll approach your creditors about accepting manageable payments. In our experience, the majority of creditors tend to agree with these as we explain your financial circumstances to them\n• You'll just make monthly payments that you can afford.\n• We'll lower your monthly payments to a manageable amount.\n• You'll only be able to pay off all of your debt with a single, manageable monthly payment.\n• On your behalf, we'll communicate with your lenders\n• We handle dealing with creditors so you won't have to.\n• On your behalf, we respond to every correspondence from your creditors.\n• We can assist you in getting out of debt so you can get your life back on track.",
                style: TextStyle(
                  color: Color(0xFF636363),
                  fontSize: 16,
                  fontFamily: GoogleFonts.rubik().fontFamily,
                  fontWeight: FontWeight.w400,
                  height: 1.8,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
