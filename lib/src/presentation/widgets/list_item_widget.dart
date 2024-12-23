import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/data/model/job_card.dart';

class ListItemWidget extends StatelessWidget {
  final JobCardModel data;

  const ListItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
    
      color: AppThemes.cardBackgroundColor,
      margin: const EdgeInsets.all(5),
      elevation: 8,
      shadowColor: AppThemes.PrimaryColor,
     
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        title: Text(
          data.Job_Number,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text(
                  data.Job_Type,
                  style: const TextStyle(
                      color: AppThemes.PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Spacer(),
                Text("Rs: ${data.Sub_Total}",
                  style: const TextStyle(
                      color: AppThemes.PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  data.Scheduled_Date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
