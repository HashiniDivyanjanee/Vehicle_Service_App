import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/constant/themes.dart';
import 'package:vehicle_service_app/src/logic/bloc/audio/audio_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/audio_upload/audio_upload_bloc.dart';
import 'package:vehicle_service_app/src/logic/bloc/take_image/image_bloc.dart';
import 'package:vehicle_service_app/src/presentation/tabs/image_upload.dart';
import 'package:vehicle_service_app/src/presentation/tabs/job_register_tab.dart';
import 'package:vehicle_service_app/src/presentation/tabs/vehical_information_tab.dart';

class JobDetails extends StatelessWidget {
  JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageBloc(),
        ),
        BlocProvider(
          create: (context) => AudioBloc(),
        ),
        BlocProvider(
          create: (context) => AudioUploadBloc(),
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Job Card Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: AppThemes.PrimaryColor,
            bottom: TabBar(
              dividerColor: Colors.white,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    child: Tab(
                        icon: Icon(
                      Icons.work,
                      color: Colors.white,
                      size: 30,
                    )),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    child: Tab(
                        icon: Icon(
                      Icons.business,
                      color: Colors.white,
                      size: 30,
                    )),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    child: Tab(
                        icon: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 30,
                    )),
                  )),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [JobRegister(), VehicalInformation(), ImageUpload()],
          ),
        ),
      ),
    );
  }
}
