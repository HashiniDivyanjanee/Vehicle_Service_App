part of 'voice_recording_bloc.dart';

abstract class VoiceRecordingState extends Equatable {
  const VoiceRecordingState();

  @override
  List<Object> get props => [];
}

final class VoiceRecordingInitial extends VoiceRecordingState {}

class RecordingInProgress extends VoiceRecordingState {}

class RecordingStopped extends VoiceRecordingState {
  final String filePath;

  RecordingStopped(this.filePath);
}

class Uploading extends VoiceRecordingState {}

class UploadSuccess extends VoiceRecordingState {}

class UploadFailure extends VoiceRecordingState {
  final String error;

  UploadFailure(this.error);
}
