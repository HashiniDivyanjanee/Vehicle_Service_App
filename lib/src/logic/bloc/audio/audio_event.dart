part of 'audio_bloc.dart';

sealed class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object> get props => [];
}

class StartRecordingEvent extends AudioEvent {}

class StopRecordingEvent extends AudioEvent {}

class SaveAudioEvent extends AudioEvent {
  final File audioFile;
  SaveAudioEvent({required this.audioFile});

  @override
  List<Object> get props => [audioFile];
}