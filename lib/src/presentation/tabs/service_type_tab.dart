import 'package:flutter/material.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_event.dart';
import 'package:vehicle_service_app/src/presentation/widgets/buttons.dart';
import 'package:vehicle_service_app/src/presentation/widgets/text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/jobcard/job_card_state.dart';

class ServiceType extends StatelessWidget {
  ServiceType({super.key});
  final TextEditingController claimController = TextEditingController();
  final TextEditingController chassisController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCardBloc(ApiProvider()),
      child: BlocConsumer<JobCardBloc, JobCardState>(
        listener: (context, state) {
          if (state is JobCardSaved) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Job Card Saved Successfully')));
          } else if (state is JobCardError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return Container(
              child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "BUSINESS DETAILS",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          "Enter Basic Details for new work order",
                          style: TextStyle(
                              color: AppThemes.SecondTextColor,
                              fontSize: AppThemes.SecondaryFontSize),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormFieldComponent(
                      controller: claimController,
                      lableText: "Claim Availble",
                      suffixIcon: Icons.event_available,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormFieldComponent(
                      controller: chassisController,
                      lableText: "Chassis Number",
                      suffixIcon: Icons.numbers,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormFieldComponent(
                      controller: noteController,
                      lableText: "Note",
                      suffixIcon: Icons.mode,
                      inputType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    state is JobCardLoading
                        ? CircularProgressIndicator()
                        : ButtonComponent(
                            buttonText: "SAVE",
                            textColor: Colors.white,
                            buttonColor: AppThemes.PrimaryColor,
                            callback: () {
                              final claim = claimController.text;
                              final chassis = chassisController.text;
                              final note = noteController.text;

                              BlocProvider.of<JobCardBloc>(context)
                                  .add(saveJobCard(claim, chassis, note));
                            }),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
