import 'package:vehicle_service_app/src/data/providers/api_provider.dart';

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





