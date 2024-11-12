import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/core/widgets/text_form_field.dart';

class ServiceType extends StatelessWidget {
  ServiceType({super.key});

  final nameController = TextEditingController();
  // final nameController = TextEditingController();
  // final nameController = TextEditingController();
  // final nameController = TextEditingController();
  // final nameController = TextEditingController();
  // final nameController = TextEditingController();
  // final nameController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Column(
        children: [
          Text(
            "SERVICE TYPE",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Enter Basic Details for new work order",
            style: TextStyle(
                color: AppThemes.SecondTextColor,
                fontSize: AppThemes.SecondaryFontSize),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormFieldComponent(
            controller: nameController,
            lableText: "Username",
            prefixIcon: Icons.person,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            obscureText: false,
          ),
           SizedBox(
            height: 5,
          ),
          TextFormFieldComponent(
            controller: nameController,
            lableText: "Username",
            prefixIcon: Icons.person,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            obscureText: false,
          ),
           SizedBox(
            height: 5,
          ),
          TextFormFieldComponent(
            controller: nameController,
            lableText: "Username",
            prefixIcon: Icons.person,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            obscureText: false,
          ),
           SizedBox(
            height: 5,
          ),
          TextFormFieldComponent(
            controller: nameController,
            lableText: "Username",
            prefixIcon: Icons.person,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            obscureText: false,
          ),
           SizedBox(
            height: 5,
          ),
          TextFormFieldComponent(
            controller: nameController,
            lableText: "Username",
            prefixIcon: Icons.person,
            inputType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            obscureText: false,
          ),
          
        ],
      ),
    ));
  }
}
