import 'package:flutter/material.dart';
import '/Constrains/textstyles.dart';

class TextField_1 extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscure;
  final txttype;

  const TextField_1(
      {super.key,
      required this.controller,
      required this.label,
      this.obscure = false,
      this.txttype,
      this.hint = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: LabelTextStyle1(),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: obscure,
          style: TextStyle(),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.50, color: Color(0xFFBEBEBE)),
                  borderRadius: BorderRadius.circular(12)),
                  
              hintText: hint),
              keyboardType: txttype,
          controller: controller,
        )
      ],
    );
  }
}
