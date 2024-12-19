import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vehicle_service_app/src/data/providers/api_provider.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
   final ApiProvider apiProvider;

  ImageUploadBloc(this.apiProvider) : super(ImageUploadInitial()) {
    on<SelectImages>((event, emit) async {
      try {
        final selectedImages = await apiProvider.pickImages();
        emit(ImageSelectionSuccess(selectedImages));
      } catch (e) {
        emit(ImageSelectionFailure('Error Selecting Images: $e'));
      }
    });

   
    on<UploadImages>((event, emit) async {
      emit(ImageUploadInProgress());
      try {
         final filePaths = await apiProvider.uploadImages(event.images);
        emit(ImageUploadSuccess(filePaths));
      } catch (e) {
        emit(ImageUploadFailure('Error uploading images: $e'));
      }
    });
  }
}
