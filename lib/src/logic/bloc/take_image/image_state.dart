part of 'image_bloc.dart';

sealed class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

final class ImageInitial extends ImageState {}

final class ImagesPicked extends ImageState {
  final List<XFile> images;
  ImagesPicked(this.images);

  @override
  List<Object> get props => [images];
}

final class ImagesSaved extends ImageState {
  final List<File> images;
  ImagesSaved(this.images);

  @override
  List<Object> get props => [images];
}

final class ImageError extends ImageState {
  final String message;
  ImageError(this.message);

  @override
  List<Object> get props => [message];
}
