part of 'text_speach_bloc.dart';

abstract class TextSpeachEvent extends Equatable {
  const TextSpeachEvent();

  @override
  List<Object> get props => [];
}

class StartListening extends TextSpeachEvent {}

class StopListening extends TextSpeachEvent {}

class SaveAudio extends TextSpeachEvent {
  final String text;

  SaveAudio(this.text);
  
   @override
  List<Object> get props => [text];
}

class UpdateSpeech extends TextSpeachEvent {
  final String recognizedText;

  UpdateSpeech(this.recognizedText);

   @override
  List<Object> get props => [recognizedText];
}
