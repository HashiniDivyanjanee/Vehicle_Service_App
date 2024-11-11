import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Colors.white,
      appBar: AppBar(
        title: Text(
          "Job Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppThemes.PrimaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    width: 80,
                    height: 45,
                    decoration: BoxDecoration(color: Color.fromARGB(255, 202, 202, 202)),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
