import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/voice_recording/voice_recording_bloc.dart';

class ImageUpload extends StatefulWidget {
  ImageUpload({super.key});
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceRecordingBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Audio Recorder')),
        body: BlocConsumer<VoiceRecordingBloc, VoiceRecordingState>(
          listener: (context, state) {
            if (state is UploadSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload Successful!')));
            } else if (state is UploadFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            final bloc = context.read<VoiceRecordingBloc>();

            if (state is RecordingInProgress) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => bloc.add(StopRecording()),
                  child: Text('Stop Recording'),
                ),
              );
            } else if (state is RecordingStopped) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => bloc.add(UploadRecording(state.filePath)),
                      child: Text('Upload Audio'),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: ElevatedButton(
                  onPressed: () => bloc.add(StartRecording()),
                  child: Text('Start Recording'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}



    //  Scaffold(
    //   body: BlocConsumer<ImageBloc, ImageState>(
    //     listener: (context, state) {
    //       if (state is ImageError) {
    //         ScaffoldMessenger.of(context)
    //             .showSnackBar(SnackBar(content: Text(state.message)));
    //       } else if (state is ImagesSaved) {
    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text('Images Saved Successfully'),
    //         ));
    //       }
    //     },
    //     builder: (context, state) {
    //       if (state is ImageInitial) {
    //         return Center(child: Text('Select Images to Save'));
    //       } else if (state is ImagesPicked) {
    //         return Column(
    //           children: [
    //             Expanded(
    //               child: ListView.builder(
    //                 itemCount: state.images.length,
    //                 itemBuilder: (context, index) {
    //                   return SizedBox(
    //                       width: double.infinity,
    //                       height: 400,
    //                       child: Image.file(File(state.images[index].path)));
    //                 },
    //               ),
    //             ),
    //             ButtonComponent(
    //                 buttonText: "SAVE",
    //                 textColor: Colors.white,
    //                 buttonColor: AppThemes.PrimaryColor,
    //                 callback: () {
    //                   context
    //                       .read<ImageBloc>()
    //                       .add(SaveImagesEvent(images: state.images));
    //                 }),
    //           ],
    //         );
    //       } else if (state is ImagesSaved) {
    //         return Center(
    //             child: Text(
    //           'Images Saved Successfully',
    //           style: TextStyle(color: Colors.green),
    //         ));
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     },
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         context.read<ImageBloc>().add(PickImagesEvent());
    //       },
    //       child: Icon(Icons.add_a_photo, color: AppThemes.PrimaryColor)),
    // );