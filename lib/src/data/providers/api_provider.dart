import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.13:5000/api'));

  Future<void> saveJobCard(String claim, String chassis, String note) async {
    try {
      final response = await dio.post('/jobcard',
          data: {'claim': claim, 'chassis': chassis, 'note': note});
      print('Response from Server: ${response.data}');
    } catch (e, stackTrace) {
      print('Error Saving JobCard: $e');
      print(stackTrace);
      rethrow;
    }
  }
}

