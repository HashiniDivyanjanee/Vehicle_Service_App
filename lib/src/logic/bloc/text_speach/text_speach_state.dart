part of 'text_speach_bloc.dart';

abstract class TextSpeachState extends Equatable {
  const TextSpeachState();

  @override
  List<Object> get props => [];
}

final class TextSpeachInitial extends TextSpeachState {}

class SpeechInitial extends TextSpeachState {}

class SpeechListening extends TextSpeachState {}

class SpeechStopped extends TextSpeachState {}

class SpeechSaved extends TextSpeachState {
  final String filePath;

  SpeechSaved(this.filePath);

  @override
  List<Object> get props => [filePath];
}

class SpeechError extends TextSpeachState {
  final String message;

  SpeechError(this.message);

  @override
  List<Object> get props => [message];
}
