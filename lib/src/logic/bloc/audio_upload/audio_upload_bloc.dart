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
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/audio_recording.wav';
      final file = File(filePath);
      await file.create(recursive: true);
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
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(event.filePath,
            filename: 'audio_recording.wav'),
      });
      final response = await dio.post(
        'http://192.168.1.13:5000/api/audio',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (response.statusCode == 200) {
        emit(AudioUploadSuccess());
      } else {
        emit(AudioUploadFailure(
            'Failed to upload recording: ${response.statusCode} ${response.statusMessage}'));
      }
    } on DioError catch (e) {
      emit(AudioUploadFailure('DioError: ${e.response?.statusCode} ${e.message}'));
    } catch (e) {
      emit(AudioUploadFailure(e.toString()));
    }
  }
}