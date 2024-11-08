import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/config/routes/app_rout_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
