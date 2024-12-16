import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  String? _filePath;

  AudioBloc() : super(AudioInitialState()) {
    on<CheckPermissionEvent>(_checkPermission);
    on<StartRecordingEvent>(_startAudio);
    on<StopRecordingEvent>(_stopAudio);
  }

  Future<void> _startAudio(
      StartRecordingEvent event, Emitter<AudioState> emit) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      _filePath = '${directory.path}/recorded_voice.aac';

      await _recorder.openRecorder();
      await _recorder.startRecorder(
        toFile: _filePath,
        codec: Codec.aacADTS,
      );
      emit(AudioRecordingState());
    } catch (e) {
      emit(AudioErrorState(e.toString()));
    }
  }

 Future<void> _checkPermission(
    CheckPermissionEvent event, Emitter<AudioState> emit) async {
  if (await Permission.microphone.isGranted) {
    emit(AudioPermissionGrantedState());
    return;
  }
  final states = await Permission.microphone.request();
  if (!states.isGranted) {
    emit(AudioErrorState("Microphone permission Denied"));
  } else {
    emit(AudioPermissionGrantedState());
  }
}


  Future<void> _stopAudio(
      StopRecordingEvent event, Emitter<AudioState> emit) async {
    try {
      await _recorder.stopRecorder();
      emit(AudioRecordedState(_filePath!));
    } catch (e) {
      emit(AudioErrorState(e.toString()));
    } finally {
      await _recorder.closeRecorder();
    }
  }

  @override
  Future<void> close() {
    _recorder.closeRecorder();
    return super.close();
  }
}
