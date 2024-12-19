import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/take_image/image_bloc.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: BlocConsumer<ImageBloc, ImageState>(
        listener: (context, state) {
          if (state is ImageError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ImagesSaved) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Images Saved Successfully'),
            ));
          }
        },
        builder: (context, state) {
          if (state is ImageInitial) {
            return Text('Pick images to save');
          } else if (state is ImagesPicked) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.images.length,
                    itemBuilder: (context, index) {
                      return Image.file(File(state.images[index].path));
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ImageBloc>().add(SaveImagesEvent(images: state.images));
                  },
                  child: Text('Save Images'),
                ),
              ],
            );
          } else if (state is ImagesSaved) {
            return Center(child: Text('Images Saved Successfully'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ImageBloc>().add(PickImagesEvent());
      }, child: Icon(Icons.add_a_photo)),
    );
  }
}
