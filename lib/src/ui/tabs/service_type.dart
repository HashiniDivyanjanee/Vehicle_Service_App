import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/core/widgets/buttons.dart';
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
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "BUSINESS DETAILS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Enter Basic Details for new work order",
                    style: TextStyle(
                        color: AppThemes.SecondTextColor,
                        fontSize: AppThemes.SecondaryFontSize),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Claim Availble",
                suffixIcon: Icons.event_available,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Chassis Number",
                suffixIcon: Icons.numbers,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormFieldComponent(
                controller: nameController,
                lableText: "Note",
                suffixIcon: Icons.mode,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 5,
              ),
              SizedBox(
                height: 15,
              ),
              ButtonComponent(
                  buttonText: "SAVE",
                  textColor: Colors.white,
                  buttonColor: AppThemes.PrimaryColor,
                  callback: () {}),
            ],
          ),
        ),
      ),
    ));
  }
}
