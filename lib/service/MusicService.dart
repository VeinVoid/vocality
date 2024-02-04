import 'package:dio/dio.dart';
import 'package:vocality/config/env.dart';
import 'package:vocality/model/MusicModel.dart';

class MusicService {
  final Dio dio = Dio();

  fetchMusicData() async {
    try {
      final response = await dio.get(BASEURL + MUSICENDPOINT);
      Map<String, dynamic> responseData = response.data;

      if (response.statusCode == 200) {
        List<dynamic> musicData = responseData['data'];
        List<dynamic> musicDataList = musicData.map((music) => MusicData.fromJson(music)).toList(); 

        return musicDataList;
      } else {
        throw Exception('Failed to load music data');
      } 
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}