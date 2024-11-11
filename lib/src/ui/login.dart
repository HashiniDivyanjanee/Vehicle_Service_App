import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_service_app/src/config/routes/app_rout_cons.dart';
import 'package:vehicle_service_app/src/constant/assest_path.dart';
import 'package:vehicle_service_app/src/constant/front.dart';
import 'package:vehicle_service_app/src/constant/string.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/core/widgets/buttons.dart';
import 'package:vehicle_service_app/src/core/widgets/clip_path_widgets.dart';
import 'package:vehicle_service_app/src/core/widgets/text_form_field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final nameController = TextEditingController();
  final pwController = TextEditingController();
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
              height: 40,
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
            TextFormFieldComponent(
              controller: pwController,
              lableText: "Password",
              prefixIcon: Icons.lock,
              inputType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.characters,
              obscureText: true,
            ),
            Container(
              margin: EdgeInsets.only(right: 25),
              child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Fogot your Password?",
                        style: TextStyle(
                            color: AppThemes.SecondTextColor,
                            fontSize: AppThemes.SecondaryFontSize),
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonComponent(
                buttonText: "LOGIN",
                textColor: Colors.white,
                buttonColor: AppThemes.PrimaryColor,
                callback: () {
                  GoRouter.of(context).pushNamed(MyAppRouteConstants.job_detailsRoute);
                }),
          ],
        ),
      ),
    );
  }
}
