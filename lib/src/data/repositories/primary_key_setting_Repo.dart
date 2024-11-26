import 'package:vehicle_service_app/src/data/providers/api_provider.dart';
import 'package:vehicle_service_app/src/logic/bloc/primary_key_setting/primary_key_setting_event.dart';

class PrimaryKeySettingRepo {
  final ApiProvider apiProvider;
  PrimaryKeySettingRepo(this.apiProvider);


  Future<List<dynamic>> getPrimaryKeySetting() {
    return apiProvider.fetchPrimaryKeySetting();
  }

  Future<void>updatePrimaryKeySetting(int latestID) async{
    await apiProvider.updatePrimaryKeySetting(latestID);
  }
}





