import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/presentation/widgets/card_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.PrimaryColor,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card_Widget(
                    cardname: 'CUSTOMER',
                    card_icon: Icons.person,
                  ),
                  Card_Widget(
                    cardname: 'JOB CARD',
                    card_icon: Icons.pest_control,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card_Widget(
                    cardname: 'TEST 1',
                    card_icon: Icons.text_snippet,
                  ),
                  Card_Widget(
                    cardname: 'TEST 2',
                    card_icon: Icons.safety_check,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card_Widget(
                    cardname: 'TEST 3',
                    card_icon: Icons.dangerous,
                  ),
                  Card_Widget(
                    cardname: 'TEST 4',
                    card_icon: Icons.kayaking,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card_Widget(
                    cardname: 'TEST 5',
                    card_icon: Icons.wallet,
                  ),
                  Card_Widget(
                    cardname: 'TEST 6',
                    card_icon: Icons.face,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
