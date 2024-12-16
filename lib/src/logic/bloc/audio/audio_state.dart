part of 'audio_bloc.dart';

abstract class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

final class AudioInitialState extends AudioState {}

final class AudioRecordingState extends AudioState {}

final class AudioPermissionGrantedState extends AudioState {}


final class AudioRecordedState extends AudioState {
  final String filepath;
  AudioRecordedState(this.filepath);

  @override
  List<Object> get props => [filepath];
}

final class AudioErrorState extends AudioState {
  final String message;
  AudioErrorState(this.message);

  @override
  List<Object> get props => [message];
}
