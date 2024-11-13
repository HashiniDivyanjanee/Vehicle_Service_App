import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/core/widgets/buttons.dart';
import 'package:vehicle_service_app/src/core/widgets/text_form_field.dart';

class VehicalInformation extends StatelessWidget {
  VehicalInformation({super.key});
  final nameController = TextEditingController();
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
                    "VEHICLE INFORMATION",
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
                    "Enter Vehicle Details",
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
                lableText: "Vehicle Number",
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
                lableText: "Current Mileage",
                suffixIcon: Icons.height,
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
                lableText: "Brand",
                suffixIcon: Icons.badge_rounded,
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
                lableText: "Model",
                suffixIcon: Icons.model_training,
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
                lableText: "Year",
                suffixIcon: Icons.date_range,
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
                lableText: "Color",
                suffixIcon: Icons.color_lens,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                obscureText: false,
                maxLines: 1,
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
