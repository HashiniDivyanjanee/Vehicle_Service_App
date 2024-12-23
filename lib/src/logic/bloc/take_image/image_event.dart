part of 'image_bloc.dart';

sealed class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class PickImagesEvent extends ImageEvent {}

class SaveImagesEvent extends ImageEvent {
  final List<XFile> images;
  SaveImagesEvent({required this.images});

  @override
  List<Object> get props => [images];
}
