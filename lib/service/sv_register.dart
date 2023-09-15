import 'package:dio/dio.dart';
import '../config/cf_api_url.dart';

Future<dynamic> registerService({
  required String username,
  required String email, 
  required String password,
  required String number,
  String? photo
}) async {

  try{
    final dio = Dio();
    final response = await dio.post(
      registerAPI,
      data: {
        'username': username,
        'email': email,
        'password': password,
        'number': number,
        'photo_profile': photo
      }
    );
    return response.statusCode;
  }
  catch (e){
    return print('Error $e');
  }
}