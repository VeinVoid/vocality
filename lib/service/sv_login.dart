import 'package:dio/dio.dart';
import '../config/cf_api_url.dart';

Future<dynamic> loginService({
  required String username, 
  required String password
}) async {
  try {
    final dio = Dio();
    final response = await dio.post(
      loginAPI,
      data: {
        'username': username,
        'password': password,
      },
    );
    return response.statusCode;
  } 
  catch (e) {
    return print('Error: $e');
  }
}
