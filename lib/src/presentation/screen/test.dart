import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/logic/bloc/take_image/image_bloc.dart';
import 'package:vehicle_service_app/src/presentation/widgets/app_bar_widget.dart';
import 'package:vehicle_service_app/src/presentation/widgets/buttons.dart';

class Test extends StatefulWidget {
  Test({super.key});
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appBarName: 'Upload Images',
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
            return Center(child: Text('Take Images to save'));
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
                ButtonComponent(
                    buttonText: "SAVE",
                    textColor: Colors.white,
                    buttonColor: AppThemes.PrimaryColor,
                    callback: () {
                      context
                          .read<ImageBloc>()
                          .add(SaveImagesEvent(images: state.images));
                    }),
              ],
            );
          } else if (state is ImagesSaved) {
            return Center(
                child: Text(
              'Images Saved Successfully',
              style: TextStyle(color: Colors.green),
            ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ImageBloc>().add(PickImagesEvent());
          },
          child: Icon(Icons.add_a_photo, color: AppThemes.PrimaryColor)),
    );
  }
}
