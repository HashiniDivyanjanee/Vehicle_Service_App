import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/data/model/job_card.dart';

class ListItemWidget extends StatelessWidget {
  final JobCardModel data;
  const ListItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.Job_Number),
      subtitle: Text(data.Job_Type),
    );
  }
}
