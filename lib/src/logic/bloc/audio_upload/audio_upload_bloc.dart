import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'audio_upload_event.dart';
part 'audio_upload_state.dart';

class AudioUploadBloc extends Bloc<AudioUploadEvent, AudioUploadState> {
  AudioUploadBloc() : super(AudioUploadInitial()) {
    on<StartRecording>(_onStartRecording);
    on<StopRecording>(_onStopRecording);
    on<UploadRecording>(_onUploadRecording);
  }

  Future<void> _onStartRecording(
      StartRecording event, Emitter<AudioUploadState> emit) async {
    var state = await Permission.microphone.request();
    if (state.isGranted) {
      emit(AudioRecordingInProgress());
    } else {
      emit(AudioUploadFailure('Microphone Permission Denied'));
    }
  }

  Future<void> _onStopRecording(
    StopRecording event, Emitter<AudioUploadState> emit) async {
  try {
    final directoryPath = 'D:\Audio_folder';
    final directory = Directory(directoryPath);

    if (!directory.existsSync()) {
      await directory.create(recursive: true);
    }

    final filePath = '$directoryPath/audio_recording.wav';
    final file = File(filePath);
    await file.writeAsBytes([]);
    emit(AudioRecordingSuccess(filePath));
  } catch (e) {
    emit(AudioRecordingFailure(e.toString()));
  }
}

  Future<void> _onUploadRecording(
      UploadRecording event, Emitter<AudioUploadState> emit) async {
    emit(AudioUploadInProgress());
    try {
      final dio = Dio();
      final file = File(event.filePath);

      if (!file.existsSync()) {
        emit(AudioUploadFailure("Error: File not found at ${event.filePath}"));
        return;
      }

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(event.filePath,
            filename: event.filePath.split('/').last),
      });

      final response = await dio.post(
        'http://192.168.1.13:5000/api/audio',
        data: formData,
      );

      if (response.statusCode == 200) {
        emit(AudioUploadSuccess());
      } else if (response.statusCode == 400) {
        emit(AudioUploadFailure(
            "Error: DioException [bad response]: This exception was thrown because the response has a status code of 400 and RequestOptions.validateStatus was configured to throw for this status code. The status code of 400 has the following meaning: Client error - the request contains bad syntax or cannot be fulfilled. Read more about status codes at https://developer.mozilla.org/en-US/docs/Web/HTTP/Status. In order to resolve this exception you typically have either to verify and fix your request code or you have to fix the server code."));
      } else {
        emit(AudioUploadFailure("Failed to Upload Recording: ${response.data}"));
      }
    } catch (e) {
      emit(AudioUploadFailure(e.toString()));
    }
  }
}