part of 'voice_recording_bloc.dart';

abstract class VoiceRecordingEvent extends Equatable {
  const VoiceRecordingEvent();

  @override
  List<Object> get props => [];
}

class StartRecording extends VoiceRecordingEvent {}

class StopRecording extends VoiceRecordingEvent {}

class UploadRecording extends VoiceRecordingEvent {
  final String filePath;

  UploadRecording(this.filePath);
}
