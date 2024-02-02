import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:vocality/global/database/MusicDatabase.dart';
import 'package:vocality/global/helper/ImageDownloader.dart';
import 'package:vocality/model/FavouriteModel.dart';
import 'package:vocality/model/MusicModel.dart';
import 'package:vocality/service/MusicService.dart';

class MusicController extends GetxController {
  final MusicService musicService = MusicService();
  RxBool isConnectedInternet = false.obs;
  RxList<dynamic> musicDataList = <dynamic>[].obs;
  RxList<FavouriteData> favouriteDataList = <FavouriteData>[].obs;

  onInit() {
    super.onInit();
    fetchMusicData();
  }

  Future<void> fetchMusicData() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        isConnectedInternet.value = true;
        final List<MusicData> data = await musicService.fetchMusicData();
        musicDataList.assignAll(data);
        addMusicDataToLocalDatabase();
      }
      else if (connectivityResult == ConnectivityResult.none) {
        isConnectedInternet.value = false;
        MusicDatabase().getMusics().then((value) {
          for (MusicDataLocal musicDataLocal in value) {
            musicDataList.assignAll(value);

            print("ID: ${musicDataLocal.id_music}, Title: ${musicDataLocal.title}, Cover Path: ${musicDataLocal.cover}");
          }
        });
        print("doesn't have internet");
      }
    } catch (e) {
      print('Error fetching music data: $e');
    }
  }

  Future<void> addMusicDataToLocalDatabase() async {
    for (var i = 0; i < 3; i++) {
      var musicData = musicDataList[i];
      File imageFile = await ImageController().downloadAndSaveImage(musicData.cover, musicData.title + '.png');
        
      MusicDataLocal musicDataLocal = MusicDataLocal(
        id_music: musicData.id_music,
        title: musicData.title,
        artist_name: musicData.artist_name,
        cover: imageFile.path,
      );

      await MusicDatabase().insertMusic(musicDataLocal);
    }
  }
}