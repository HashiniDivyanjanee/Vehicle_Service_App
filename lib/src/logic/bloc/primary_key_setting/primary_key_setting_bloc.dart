import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/data/repositories/primary_key_setting_Repo.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_settimg_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_state.dart';

class PrimaryKeySettingBloc
    extends Bloc<PrimaryKeySettimgEvent, PrimaryKeySettingState> {
  final PrimaryKeySettingRepo primaryKeySettingRepo;

  PrimaryKeySettingBloc(this.primaryKeySettingRepo)
      : super(PrimaryKeySettingInitial()) {
    on<fetchPrimaryKeySetting>((event, emit) async {
      emit(PrimaryKeySettingLoading());
      try {
        final primaryKeySetting =
            await primaryKeySettingRepo.getPrimaryKeySetting();
        emit(PrimaryKeySettingLoaded(primaryKeySetting));
      } catch (e) {
        emit(PrimaryKeySettingError(e.toString()));
      }
    });
  }
}
