import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'text_speach_event.dart';
part 'text_speach_state.dart';

class TextSpeachBloc extends Bloc<TextSpeachEvent, TextSpeachState> {
  final SpeechToText _speechToText = SpeechToText();
  TextSpeachBloc() : super(TextSpeachInitial()) {
    on<StartListening>(_startListening);
    on<StopListening>(_stopListening);
    on<SaveAudio>(_saveAudio);
  }

  Future<void> _startListening(
      StartListening event, Emitter<TextSpeachState> emit) async {
    bool available = await _speechToText.initialize();
    if (available) {
      _speechToText.listen(onResult: (result) {
        add(UpdateSpeech(result.recognizedWords));
      });
      emit(SpeechListening());
    } else {
      emit(SpeechError("Speech recognition not available"));
    }
  }

  Future<void> _stopListening(
      StopListening event, Emitter<TextSpeachState> emit) async {
    _speechToText.stop();
    emit(SpeechStopped());
  }

  Future<void> _saveAudio(
      SaveAudio event, Emitter<TextSpeachState> emit) async {
    try {
      final directoryPath = 'D:/Audio_folder';
      final directory = Directory(directoryPath);

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final filePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.txt';
      final file = File(filePath);
      await file.writeAsString(event.text);
      print('File saved at: $filePath');
      emit(SpeechSaved(filePath));
    } catch (e) {
      emit(SpeechError("Failed to save audio: $e"));
    }
  }
}
