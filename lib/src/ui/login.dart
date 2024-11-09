import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/assest_path.dart';
import 'package:vehicle_service_app/src/constant/front.dart';
import 'package:vehicle_service_app/src/constant/string.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/core/widgets/clip_path_widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const Text(
            AppStrings.welcomeMessage,
            style: TextStyle(
                color: AppThemes.PrimaryColor,
                fontSize: AppThemes.headerFontSize,
                fontFamily: AppFontFamily.secondaryFont),
          ),
          const SizedBox(
            height: 10,
          ),
        
        ],
      ),
    );
  }
}
