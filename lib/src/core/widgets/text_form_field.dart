import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatefulWidget {
  TextInputType? textInputType;
  String hintText;
  bool? obscureText;
  TextEditingController controller;

  TextFormFieldComponent({super.key, this.textInputType, required this.hintText, this.obscureText, required this.controller, required InputDecoration decoration, TextInputType? keyboardType});

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText ),
      obscureText: widget.obscureText ?? false,
      controller:widget.controller,
      keyboardType: widget.textInputType,
      
    );
  }
}
