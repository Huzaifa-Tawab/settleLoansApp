import 'package:flutter/material.dart';
import 'package:settle_loans/Components/icons.dart';
import 'package:settle_loans/Constrains/textstyles.dart';

class KIconButton extends StatelessWidget {
  String title;
  Function onPressed;
  Widget Img;
  KIconButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.Img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
