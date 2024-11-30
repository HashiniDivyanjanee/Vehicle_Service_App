import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_service_app/src/config/routes/app_rout_cons.dart';
import 'package:vehicle_service_app/src/presentation/widgets/app_bar_widget.dart';
import 'package:vehicle_service_app/src/presentation/widgets/card_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBarName: 'Dashboard',),
      body: Padding(
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
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.customer);
                      }),
                  Card_Widget(
                      cardname: 'JOB CARD',
                      card_icon: Icons.pest_control,
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.job_detailsRoute);
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card_Widget(
                    cardname: 'TEST 1',
                    card_icon: Icons.text_snippet,
                    callback: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.job_detailsRoute);
                    },
                  ),
                  Card_Widget(
                      cardname: 'TEST 2',
                      card_icon: Icons.safety_check,
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.job_detailsRoute);
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card_Widget(
                      cardname: 'TEST 3',
                      card_icon: Icons.dangerous,
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.job_detailsRoute);
                      }),
                  Card_Widget(
                      cardname: 'TEST 4',
                      card_icon: Icons.kayaking,
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.job_detailsRoute);
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card_Widget(
                      cardname: 'TEST 5',
                      card_icon: Icons.wallet,
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.job_detailsRoute);
                      }),
                  Card_Widget(
                      cardname: 'TEST 6',
                      card_icon: Icons.face,
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRouteConstants.job_detailsRoute);
                      }),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
