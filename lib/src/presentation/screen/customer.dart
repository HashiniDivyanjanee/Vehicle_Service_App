import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/presentation/widgets/app_bar_widget.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appBarName: 'Customer',
      ),
    );
  }
}
