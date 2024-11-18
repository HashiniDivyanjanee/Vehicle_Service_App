import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/front.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';

class TextFormFieldComponent extends StatelessWidget {
  final TextInputType? inputType;

  final bool obscureText;
  final TextEditingController controller;
  final IconData suffixIcon;
  final TextCapitalization textCapitalization;
  final String lableText;
  final int maxLines;
  TextFormFieldComponent({
    super.key,
    required this.lableText,
    required this.maxLines,
    required this.obscureText,
    required this.controller,
    required this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 25, right: 25),
      child: TextField(
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        maxLength: 32,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black, fontSize: 12),
        decoration: InputDecoration(
            suffixIcon: Icon(
              suffixIcon,
              color: AppThemes.PrimaryColor,
            ),
            isDense: true,
            labelText: lableText,
            filled: true,
            fillColor: AppThemes.TextField_Bg_Color,
            counterText: "",
            labelStyle: const TextStyle(
                color: AppThemes.SecondTextColor,
                fontSize: 15,
                fontFamily: AppFontFamily.HintTextFont),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none // remove frame
                )),
      ),
    );
  }
}
