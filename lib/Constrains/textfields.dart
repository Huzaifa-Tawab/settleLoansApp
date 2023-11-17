import 'package:flutter/material.dart';
import '/Constrains/textstyles.dart';

class TextField_1 extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscure;
  final txttype;
  final String? Function(String?)? validator;

  const TextField_1({
    super.key,
    required this.controller,
    required this.label,
    this.obscure = false,
    this.txttype,
    this.hint = '',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: LabelTextStyle1(),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: validator,
          obscureText: obscure,
          style: const TextStyle(),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 0.50, color: Color(0xFFBEBEBE)),
                  borderRadius: BorderRadius.circular(12)),
              hintText: hint),
          keyboardType: txttype,
          controller: controller,
        )
      ],
    );
  }
}
