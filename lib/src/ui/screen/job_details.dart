import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/ui/tabs/service_type.dart';
import 'package:vehicle_service_app/src/ui/tabs/vehical_information.dart';

class JobDetails extends StatelessWidget {
  JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Job Details',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppThemes.PrimaryColor,
        ),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(
                text: "Service Type",
              ),
              Tab(
                text: "Vehical Information",
              ),
            ]),
            Expanded(
              child:
                  TabBarView(children: [ServiceType(), VehicalInformation()]),
            ),
          ],
        ),
      ),
    );
  }
}
