import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/audio/audio_bloc.dart';

class VehicalInformation extends StatefulWidget {
  const VehicalInformation({Key? key}) : super(key: key);

  @override
  State<VehicalInformation> createState() => _VehicalInformationState();
}

class _VehicalInformationState extends State<VehicalInformation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Voice Recorder')),
        body: BlocBuilder<AudioBloc, AudioState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<AudioBloc>(context);

            if (state is AudioInitialState) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => bloc.add(CheckPermissionEvent()),
                  child: Text('Request Permissions'),
                ),
              );
            } else if (state is AudioRecordingState) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => bloc.add(StopRecordingEvent()),
                  child: Text('Stop Recording'),
                ),
              );
            } else if (state is AudioRecordedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Recording saved at: ${state.filepath}'),
                    ElevatedButton(
                      onPressed: () => bloc.add(StartRecordingEvent()),
                      child: Text('Record Again'),
                    ),
                  ],
                ),
              );
            } else if (state is AudioErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            return Center(
              child: ElevatedButton(
                onPressed: () => BlocProvider.of<AudioBloc>(context)
                    .add(StartRecordingEvent()),
                child: Text('Start Recording'),
              ),
            );
          },
        ),
      ),
    );
  }
}