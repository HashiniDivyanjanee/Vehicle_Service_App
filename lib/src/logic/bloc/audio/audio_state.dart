part of 'audio_bloc.dart';

sealed class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

final class AudioInitial extends AudioState {}

final class RecordingInProgress extends AudioState {}

final class RecordingStopped extends AudioState {
  final File audioFile;
  RecordingStopped(this.audioFile);

  @override
  List<Object> get props => [audioFile];
}

final class AudioSaved extends AudioState {
  final File audioFile;
  AudioSaved(this.audioFile);

  @override
  List<Object> get props => [audioFile];
}

final class AudioError extends AudioState {
  final String message;
  AudioError(this.message);

  @override
  List<Object> get props => [message];
}