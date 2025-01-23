import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
part 'voice_recording_event.dart';
part 'voice_recording_state.dart';

class VoiceRecordingBloc
    extends Bloc<VoiceRecordingEvent, VoiceRecordingState> {
  String? _filePath;
  FlutterSoundPlayer? _player;
  FlutterSoundRecorder? _recorder;

  VoiceRecordingBloc() : super(VoiceRecordingInitial()) {
    _player = FlutterSoundPlayer();
    _recorder = FlutterSoundRecorder();
    
    on<StartRecording>((event, emit) async {
      emit(RecordingInProgress());
      final directory = await getApplicationDocumentsDirectory();
      _filePath =
          '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

       await _recorder!.startRecorder(toFile: _filePath!);
    });

    on<StopRecording>((event, emit) async {
      await _recorder?.stopRecorder();
      emit(RecordingStopped(_filePath!));
    });

    on<UploadRecording>((event, emit) async {
      emit(Uploading());
      try {
        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(event.filePath),
        });

        final response = await Dio().post(
          'http://192.168.1.13:5000/api/recording',
          data: formData,
        );

        if (response.statusCode == 200) {
          emit(UploadSuccess());
        } else {
          emit(UploadFailure('Failed to upload'));
        }
      } catch (e) {
        emit(UploadFailure(e.toString()));
      }
    });
  }
}
