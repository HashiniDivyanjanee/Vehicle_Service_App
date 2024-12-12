import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_state.dart';
import 'package:vehicle_service_app/src/presentation/widgets/app_bar_widget.dart';
import 'package:vehicle_service_app/src/presentation/widgets/list_item_widget.dart';

class ViewJobCard extends StatefulWidget {
  const ViewJobCard({super.key});
  @override
  State<ViewJobCard> createState() => _ViewJobCardState();
}

class _ViewJobCardState extends State<ViewJobCard> {
  @override
  void initState() {
    super.initState();

    context.read<JobCardBloc>().add(FetchJobCard());
  }
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: const AppBarWidget(
        appBarName: 'Job Card',
      ),
      body: BlocBuilder<JobCardBloc, JobCardState>(
        builder: (context, state) {
          if (state is JobCardLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is JobCardLoaded) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListItemWidget(data: state.data[index]);                
              },
            );
          } else if (state is JobCardError) {
            return Center(child: Text(state.message));
          }
          return Text("No Date Available");
        },
      ),
    );
  }
}
