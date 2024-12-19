part of 'image_upload_bloc.dart';

abstract class ImageUploadState extends Equatable {
  const ImageUploadState();

  @override
  List<Object?> get props => [];
}

class ImageUploadInitial extends ImageUploadState {}

class ImageSelectionSuccess extends ImageUploadState {
  final List<File> selectedImages;

  const ImageSelectionSuccess(this.selectedImages);

  @override
  List<Object?> get props => [selectedImages];
}

class ImageUploadInProgress extends ImageUploadState {}

class ImageUploadSuccess extends ImageUploadState {
  final List<String> filePaths;

  ImageUploadSuccess(this.filePaths);

    @override
  List<Object?> get props => [filePaths];
}

class ImageUploadFailure extends ImageUploadState {
  final String error;

  ImageUploadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class ImageSelectionFailure extends ImageUploadState {
  final String error;

  ImageSelectionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
