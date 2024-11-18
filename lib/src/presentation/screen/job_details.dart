import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/presentation/tabs/service_type.dart';
import 'package:vehicle_service_app/src/presentation/tabs/vehical_information.dart';

class JobDetails extends StatelessWidget {
  JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:const Text(
            'Job Details',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppThemes.PrimaryColor,
        ),
        body: Column(
          children: [
           const TabBar(tabs: [
               Tab(
                text: "Vehical Information",
              ),
              Tab(
                text: "Business Details",
              ),
             
            ]),
            Expanded(
              child:
                  TabBarView(children: [VehicalInformation(), ServiceType()]),
            ),
          ],
        ),
      ),
    );
  }
}
