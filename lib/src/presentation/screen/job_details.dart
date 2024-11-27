import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/presentation/tabs/service_type_tab.dart';
import 'package:vehicle_service_app/src/presentation/tabs/vehical_information_tab.dart';

class JobDetails extends StatelessWidget {
  JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Job Details',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppThemes.PrimaryColor,
          bottom: TabBar(tabs: [
            Tab(
              text: "Vehical Information",
            ),
            Tab(
              text: "Business Details",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            VehicalInformation(),
            ServiceType(),
          ],
        ),
      ),
    );
  }
}
