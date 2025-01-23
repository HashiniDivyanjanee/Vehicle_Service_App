import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/text_speach/text_speach_bloc.dart';

class VehicalInformation extends StatefulWidget {
  const VehicalInformation({Key? key}) : super(key: key);

  @override
  State<VehicalInformation> createState() => _VehicalInformationState();
}

class _VehicalInformationState extends State<VehicalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Speech-to-Text")),
      body: BlocBuilder<TextSpeachBloc, TextSpeachState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state is SpeechListening) ...[
                Text("Listening..."),
              ] else if (state is SpeechStopped) ...[
                Text("Stopped"),
              ] else if (state is SpeechError) ...[
                Text("Error: ${state.message}"),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<TextSpeachBloc>().add(StartListening());
                    },
                    child: Text("Start Listening"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TextSpeachBloc>().add(StopListening());
                    },
                    child: Text("Stop Listening"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Simulated text for saving
                      context
                          .read<TextSpeachBloc>()
                          .add(SaveAudio("Sample audio text"));
                    },
                    child: Text("Save Audio"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
    // Scaffold(

    //   body: BlocBuilder<AudioUploadBloc, AudioUploadState>(
    //     builder: (context, state) {
    //       if (state is AudioUploadInitial) {
    //         return Center(
    //           child: ElevatedButton(
    //             onPressed: () {
    //               BlocProvider.of<AudioUploadBloc>(context).add(StartRecording());
    //             },
    //             child: Text('Start Recording'),
    //           ),
    //         );
    //       } else if (state is AudioRecordingInProgress) {
    //         return Center(
    //           child: ElevatedButton(
    //             onPressed: () {
    //               BlocProvider.of<AudioUploadBloc>(context).add(StopRecording());
    //             },
    //             child: Text('Stop Recording'),
    //           ),
    //         );
    //       } else if (state is AudioRecordingSuccess) {
    //         return Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text('Recording saved at: ${state.filePath}'),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   BlocProvider.of<AudioUploadBloc>(context)
    //                       .add(UploadRecording(state.filePath));
    //                 },
    //                 child: Text('Upload Recording'),
    //               ),
    //             ],
    //           ),
    //         );
    //       } else if (state is AudioUploadInProgress) {
    //         return Center(child: CircularProgressIndicator());
    //       } else if (state is AudioUploadSuccess) {
    //         return Center(child: Text('Upload Successful'));
    //       } else if (state is AudioUploadFailure) {
    //         return Center(child: Text('Error: ${state.error}'));
    //       } else if (state is AudioRecordingFailure) {
    //         return Center(child: Text('Error: ${state.message}'));
    //       }
    //       return Container();
    //     },
    //   ),
    // );

