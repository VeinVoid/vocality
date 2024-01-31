import 'package:get/get.dart';
import 'package:vocality/model/MusicModel.dart';
import 'package:vocality/service/MusicService.dart';

class MusicController extends GetxController {
  final MusicService musicService = MusicService();
  RxList<MusicData> musicDataList = <MusicData>[].obs;

  onInit() {
    super.onInit();
    fetchMusicData();
  }

  Future<void> fetchMusicData() async {
    try {
      final List<MusicData> data = await musicService.fetchMusicData();
      musicDataList.assignAll(data);
    } catch (e) {
      print('Error fetching music data: $e');
    }
  }
}