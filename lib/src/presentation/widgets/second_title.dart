import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';

class Secont_Title extends StatelessWidget {
  final String second_title;
  const Secont_Title({
    super.key,
    required this.second_title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
         second_title,
          style: const TextStyle(
              color: AppThemes.SecondTextColor,
              fontSize: AppThemes.SecondaryFontSize),
        ),
      ),
    );
  }
}
