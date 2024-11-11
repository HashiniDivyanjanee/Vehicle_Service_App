import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_service_app/src/config/routes/app_rout_cons.dart';
import 'package:vehicle_service_app/src/ui/home.dart';
import 'package:vehicle_service_app/src/ui/job_details.dart';
import 'package:vehicle_service_app/src/ui/login.dart';

final GoRouter router = GoRouter(
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
        return MaterialPage(child: Home());
      },
    ),
     GoRoute(
      name: MyAppRouteConstants.job_detailsRoute,
      path: '/job_details',
      pageBuilder: (context, state) {
        return MaterialPage(child: JobDetails());
      },
    ),
  ],
);
