import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_service_app/src/data/repositories/primary_key_setting_Repo.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_event.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_state.dart';

class PrimaryKeySettingBloc
    extends Bloc<PrimaryKeySettingEvent, PrimaryKeySettingState> {
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
     on<UpdatePrimaryKeySetting>((event, emit) async {
      try {
        emit(PrimaryKeySettingLoading());
        await primaryKeySettingRepo.updatePrimaryKeySetting(event.latestID);
        final updatedPrimaryKeySetting =
            await primaryKeySettingRepo.getPrimaryKeySetting();
        emit(PrimaryKeySettingLoaded(updatedPrimaryKeySetting));
      } catch (e) {
        emit(PrimaryKeySettingError(e.toString()));
      }
    });
  }
  
}
