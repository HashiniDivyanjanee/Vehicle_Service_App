import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/logic/bloc/image_upload/image_upload_bloc.dart';


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    _form.currentState?.validate();
  }

  @override
   Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageUploadBloc(ApiProvider()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Multiple Images'),
        ),
        body: BlocBuilder<ImageUploadBloc, ImageUploadState>(
          builder: (context, state) {
            final bloc = context.read<ImageUploadBloc>();

            if (state is ImageUploadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ImageSelectionSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.selectedImages.length,
                      itemBuilder: (context, index) {
                        return Image.file(state.selectedImages[index]);
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(UploadImages(state.selectedImages));
                    },
                    child: const Text('Upload Images'),
                  ),
                ],
              );
            }

            if (state is ImageUploadFailure) {
              return Center(child: Text('Error: ${state.error}'));
            }

            return Center(
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(SelectImages());
                },
                child: const Text('Select Images'),
              ),
            );
          },
        ),
      ),
    );
  }
}