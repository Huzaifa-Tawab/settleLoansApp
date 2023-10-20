import 'package:flutter/material.dart';
import '/Components/icons.dart';
import '/Constrains/textstyles.dart';
import '/Screens/Client/services.dart';

// ignore: must_be_immutable
class KIconButton extends StatelessWidget {
  String title;

  Widget Img;
  KIconButton({super.key, required this.title, required this.Img});

  @override
  Widget build(BuildContext context) {
    Widget x = Img;
    if (title == 'Debt solutions') {
      x = lawpicture;
    } else if (title == "Personal loan") {
      x = Iconsettlement;
    } else if (title == "Anti-harassment") {
      x = IconHaressment;
    } else if (title == "Credit card") {
      x = Iconcreditcard;
    } else if (title == "Foreclosure") {
      x = Iconfile;
    }

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
            SizedBox(height: 50, width: 50, child: x),
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
