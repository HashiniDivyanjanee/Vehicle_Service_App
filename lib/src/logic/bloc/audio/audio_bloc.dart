import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final Dio _dio = Dio();
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  late String _filePath;

  AudioBloc() : super(AudioInitial()) {
    on<StartRecordingEvent>(_onStartRecording);
    on<StopRecordingEvent>(_onStopRecording);
    on<SaveAudioEvent>(_onSaveAudio);
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    await _recorder.openRecorder();
  }

  @override
  Future<void> close() {
    _recorder.closeRecorder();
    return super.close();
  }

  Future<void> _onStartRecording(StartRecordingEvent event, Emitter<AudioState> emit) async {
    try {
      if (!_recorder.isRecording) {
        await _initializeRecorder();
      }

      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        emit(AudioError('Microphone permission not granted'));
        return;
      }

      final directory = await getApplicationDocumentsDirectory();
      _filePath = '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';

      await _recorder.startRecorder(toFile: _filePath);
      emit(RecordingInProgress());
    } catch (e) {
      emit(AudioError('Error starting recording: $e'));
    }
  }

  Future<void> _onStopRecording(StopRecordingEvent event, Emitter<AudioState> emit) async {
    try {
      await _recorder.stopRecorder();
      emit(RecordingStopped(File(_filePath)));
    } catch (e) {
      emit(AudioError('Error stopping recording: $e'));
    }
  }

  Future<void> _onSaveAudio(SaveAudioEvent event, Emitter<AudioState> emit) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(event.audioFile.path, filename: event.audioFile.path.split('/').last),
      });
      final response = await _dio.post(
        'http://192.168.1.13:5000/api/upload',
        data: formData,
      );

      if (response.statusCode == 200) {
        emit(AudioSaved(event.audioFile));
      } else {
        throw Exception('Failed to upload audio');
      }
    } catch (e) {
      emit(AudioError('Error saving audio: $e'));
    }
  }
}