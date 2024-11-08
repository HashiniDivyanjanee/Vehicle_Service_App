import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  String buttonText;
  Color textColor;
  Color buttonColor;
  VoidCallback callback;

  ButtonComponent(
      this.buttonText, this.textColor, this.buttonColor, this.callback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 16, color: textColor),
          )),
    );
  }
}
