import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_service_app/src/config/routes/app_rout_cons.dart';
import 'package:vehicle_service_app/src/presentation/screen/customer.dart';
import 'package:vehicle_service_app/src/presentation/screen/home.dart';
import 'package:vehicle_service_app/src/presentation/screen/job_details.dart';
import 'package:vehicle_service_app/src/presentation/screen/login.dart';

final GoRouter router = GoRouter(
  errorPageBuilder: (context, state) {
    return const MaterialPage(
        child: Scaffold(
      body: Center(
        child: Text("This PAge is not Found!!"),
      ),
    ));
  },
  routes: [
    GoRoute(
      name: MyAppRouteConstants.loginRoute,
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: Login());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.homeRoute,
      path: '/home',
      pageBuilder: (context, state) {
        return const MaterialPage(child: Home());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.job_detailsRoute,
      path: '/job_details',
      pageBuilder: (context, state) {
        return MaterialPage(child: JobDetails());
      },
    ),
    GoRoute(
      name: MyAppRouteConstants.customer,
      path: '/customer',
      pageBuilder: (context, state) {
        return MaterialPage(child: Customer());
      },
    )
  ],
);
