part of 'audio_upload_bloc.dart';

abstract class AudioUploadEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartRecording extends AudioUploadEvent {}

class StopRecording extends AudioUploadEvent {}

class UploadRecording extends AudioUploadEvent {
  final String filePath;

  UploadRecording(this.filePath);

  @override
  List<Object> get props => [filePath];
}