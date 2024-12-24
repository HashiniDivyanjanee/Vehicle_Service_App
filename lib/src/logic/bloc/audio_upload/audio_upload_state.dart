part of 'audio_upload_bloc.dart';

abstract class AudioUploadState extends Equatable {
  @override
  List<Object> get props => [];
}

class AudioUploadInitial extends AudioUploadState {}

class AudioRecordingInProgress extends AudioUploadState {}

class AudioRecordingSuccess extends AudioUploadState {
  final String filePath;

  AudioRecordingSuccess(this.filePath);

  @override
  List<Object> get props => [filePath];
}

class AudioRecordingFailure extends AudioUploadState {
  final String message;

  AudioRecordingFailure(this.message);

  @override
  List<Object> get props => [message];
}

class AudioUploadSuccess extends AudioUploadState{}

class AudioUploadInProgress extends AudioUploadState{}

class AudioUploadFailure extends AudioUploadState {
  final String error;
  
  AudioUploadFailure(this.error);

  @override
  List<Object> get props => [error];
}
