import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_service_app/src/config/routes/app_rout_cons.dart';
import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/logic/bloc/customer/customer_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/take_image/image_bloc.dart';
import 'package:vehicle_service_app/src/presentation/screen/customer.dart';
import 'package:vehicle_service_app/src/presentation/screen/home.dart';
import 'package:vehicle_service_app/src/presentation/screen/job_details.dart';
import 'package:vehicle_service_app/src/presentation/screen/login.dart';
import 'package:vehicle_service_app/src/presentation/screen/test.dart';
import 'package:vehicle_service_app/src/presentation/screen/view_job_card.dart';

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
        builder: (context, state) => BlocProvider(
              create: (context) => CustomerBloc(ApiProvider()),
              child: JobDetails(),
            )),
    GoRoute(
        name: MyAppRouteConstants.customer,
        path: '/customer',
        builder: (context, state) => BlocProvider(
              create: (context) => CustomerBloc(ApiProvider()),
              child: const Customer(),
            )),
    GoRoute(
        name: MyAppRouteConstants.JobCardList,
        path: '/JobCard',
        builder: (context, state) => BlocProvider(
              create: (context) => JobCardBloc(ApiProvider()),
              child: const ViewJobCard(),
            )),
    GoRoute(
        name: MyAppRouteConstants.Test,
        path: '/Test',
        builder: (context, state) => BlocProvider(
              create: (context) => ImageBloc(),
              child: Test(),
            )),
  ],
);
