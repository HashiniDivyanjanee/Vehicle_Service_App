part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();

  @override
  List<Object?> get props => [];
}

class SelectImages extends ImageUploadEvent {}

class UploadImages extends ImageUploadEvent {
  final List<File> images;
  const UploadImages(this.images);

  @override
  List<Object?> get props => [images];
}
