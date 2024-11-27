import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/data/repositories/primary_key_setting_Repo.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_state.dart';
import 'package:vehicle_service_app/src/presentation/widgets/drop_down_list.dart';


class VehicalInformation extends StatefulWidget {
  const VehicalInformation({super.key});

  @override
  _VehicalInformationState createState() => _VehicalInformationState();
}

class _VehicalInformationState extends State<VehicalInformation> {
  final nameController = TextEditingController();
  String combinedValue = '';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PrimaryKeySettingBloc(PrimaryKeySettingRepo(ApiProvider()))
                ..add(fetchPrimaryKeySetting()),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<PrimaryKeySettingBloc, PrimaryKeySettingState>(
                  builder: (context, state) {
                    if (state is PrimaryKeySettingLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is PrimaryKeySettingLoaded) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.primarykeysetting.length,
                        itemBuilder: (context, index) {
                          final setting = state.primarykeysetting[index];
                          // Update combinedValue based on fetched data
                          combinedValue =
                              '${setting['Prefix'] ?? ''}${((int.tryParse(setting['LatestID']?.toString() ?? '0') ?? 0) + 1)}';

                          return ListTile(
                            title: Text(setting['Prefix']?.toString() ?? ''),
                            subtitle: Text(combinedValue),
                          );
                        },
                      );
                    } else if (state is PrimaryKeySettingError) {
                      return Text("Error: ${state.message}");
                    }
                    return const Text("No Data Available");
                  },
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
