import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/assest_path.dart';
import 'package:vehicle_service_app/src/constant/front.dart';
import 'package:vehicle_service_app/src/constant/string.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/core/widgets/clip_path_widgets.dart';
import 'package:vehicle_service_app/src/core/widgets/text_form_field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              child: Container(
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssestPath.background),
                      fit: BoxFit.cover,
                    ),
                  )),
              clipper: AppCustomeClipper(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                AppStrings.welcomeMessage,
                style: TextStyle(
                    color: AppThemes.PrimaryColor,
                    fontSize: AppThemes.PrimaryFontSize,
                    fontFamily: AppFontFamily.secondaryFont),
              ),
            ),
            Text(
              "Sign in to Continue",
              style: TextStyle(
                  color: AppThemes.SecondTextColor,
                  fontSize: AppThemes.SecondaryFontSize),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldComponent(
              controller: nameController,
              hintText: "UserName",
              prefixIcon: Icons.person,
              inputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            )
          ],
        ),
      ),
    );
  }
}
