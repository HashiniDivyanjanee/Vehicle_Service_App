import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
   final TextInputType? inputType;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final TextCapitalization textCapitalization;

  TextFormFieldComponent({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    required this.prefixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: TextField(
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLength: 32,
        maxLines: 1,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: 16),
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            isDense: true,
            labelText: hintText,
            counterText: "",
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
