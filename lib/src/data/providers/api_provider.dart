import 'package:dio/dio.dart';

class ApiProvider {
 final Dio dio = Dio(BaseOptions(baseUrl: 'http://localhost:5000/api'));

  Future<void> saveJobCard(String claim, String chassis, String note) async {
    try {
      await dio.post('/jobcard',
          data: {'claim': claim, 'chassis': chassis, 'note': note});
    } catch (e) {
      print('Error Saving JobCard: $e');
      rethrow;
    }
  }
}
