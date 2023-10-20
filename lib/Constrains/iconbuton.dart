import 'package:flutter/material.dart';
// import '/Components/icons.dart';
import '/Constrains/textstyles.dart';
import '/Screens/Client/services.dart';

// ignore: must_be_immutable
class KIconButton extends StatelessWidget {
  String title;

  Widget Img;
  KIconButton({super.key, required this.title, required this.Img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ServicesPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 80,
        width: MediaQuery.of(context).size.width / 2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffFFFCF3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 50, width: 50, child: Img),
            Text(
              title,
              style: LabelTextStyle3(),
            ),
          ],
        ),
      ),
    );
  }
}
