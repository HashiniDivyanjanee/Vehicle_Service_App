import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_service_app/src/config/routes/app_rout_cons.dart';
import 'package:vehicle_service_app/src/ui/home.dart';


final GoRouter router = GoRouter(
  routes: [
      GoRoute(
          name: MyAppRouteConstants.homeRoute,
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: Home());
          },
        ),
 
  ],
);