import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();
  
  ImageBloc() : super(ImageInitial()) {
    on<PickImagesEvent>(_onPickImages);
    on<SaveImagesEvent>(_onSaveImages);
  }

  Future<void> _onPickImages(PickImagesEvent event, Emitter<ImageState> emit) async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      emit(ImagesPicked(images));
    } else {
      emit(ImageError('No Images Selected'));
    }
  }

  Future<void> _onSaveImages(SaveImagesEvent event, Emitter<ImageState> emit) async {
    try {
      final List<File> savedImages = [];
      for (var image in event.images) {
        final File file = File(image.path);
        final formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
        });
        final response = await _dio.post(
          'http://192.168.1.13:5000/api/upload',
          data: formData,
        );

        if (response.statusCode == 200) {
          savedImages.add(file);
          print('Uploaded image path: ${file.path}');
        } else {
          throw Exception('Failed to upload image');
        }
      }
      emit(ImagesSaved(savedImages));
    } catch (e) {
      emit(ImageError('Error Saving Images: $e'));
    }
  }
}
