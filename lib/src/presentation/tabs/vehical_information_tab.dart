import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/logic/bloc/audio/audio_bloc.dart';

import 'package:vehicle_service_app/src/logic/bloc/audio_upload/audio_upload_bloc.dart';
import 'package:vehicle_service_app/src/presentation/widgets/buttons.dart';

class VehicalInformation extends StatefulWidget {
  const VehicalInformation({Key? key}) : super(key: key);

  @override
  State<VehicalInformation> createState() => _VehicalInformationState();
}

class _VehicalInformationState extends State<VehicalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AudioBloc, AudioState>(
        listener: (context, state) {
          if (state is AudioError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AudioSaved) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Audio Saved Successfully'),
            ));
          }
        },
        builder: (context, state) {
          if (state is AudioInitial) {
            return Center(child: Text('Press the button to start recording'));
          } else if (state is RecordingInProgress) {
            return Center(child: Text('Recording...'));
          } else if (state is RecordingStopped) {
            return Column(
              children: [
                Text('Recording stopped.'),
                ButtonComponent(
                    buttonText: "SAVE",
                    textColor: Colors.white,
                    buttonColor: AppThemes.PrimaryColor,
                    callback: () {
                      context
                          .read<AudioBloc>()
                          .add(SaveAudioEvent(audioFile: state.audioFile));
                    }),
              ],
            );
          } else if (state is AudioSaved) {
            return Center(
                child: Text(
              'Audio Saved Successfully',
              style: TextStyle(color: Colors.green),
            ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final audioBloc = context.read<AudioBloc>();
            if (audioBloc.state is RecordingInProgress) {
              audioBloc.add(StopRecordingEvent());
            } else {
              audioBloc.add(StartRecordingEvent());
            }
          },
          child: Icon(Icons.mic, color: AppThemes.PrimaryColor)),
    );
  }
}