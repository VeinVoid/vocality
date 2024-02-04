import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:vocality/global/database/FavouriteDatabase.dart';
import 'package:vocality/global/database/MusicDatabase.dart';
import 'package:vocality/global/helper/ImageDownloader.dart';
import 'package:vocality/model/FavouriteModel.dart';
import 'package:vocality/model/MusicModel.dart';
import 'package:vocality/service/MusicService.dart';

class MusicController extends GetxController {
  final MusicService musicService = MusicService();
  RxBool isConnectedInternet = false.obs;
  RxList<dynamic> musicDataList = <dynamic>[].obs;
  RxList<dynamic> favouriteDataList = <dynamic>[].obs;

  onInit() {
    super.onInit();
    fetchMusicData();
    getFavouriteData();
  }

  Future<void> fetchMusicData() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        isConnectedInternet.value = true;
        musicDataList.clear();
        final List<MusicData> data = await musicService.fetchMusicData();
        musicDataList.assignAll(data);
        addMusicDataToLocalDatabase();
      }
      else if (connectivityResult == ConnectivityResult.none) {
        isConnectedInternet.value = false;
        musicDataList.clear();
        MusicDatabase().getMusics().then((value) {
          for (MusicDataLocal musicDataLocal in value) {
            musicDataList.assignAll(value);
          }
        });
      }
    } catch (e) {
      print('Error fetching music data: $e');
    }
  }

  Future<void> getFavouriteData() async {
    FavouriteDatabase().getFavourites().then((value) {
      for (FavouriteData favouriteData in value) {
        favouriteDataList.assignAll(value);
        print(favouriteData.cover);
      }
    });
  }

  Future<void> addMusicDataToLocalDatabase() async {
    MusicDatabase().clearMusic();
    List shuffledMusicData = List.from(musicDataList);
    shuffledMusicData.shuffle();

    for (var i = 0; i < 3; i++) {
      var musicData = shuffledMusicData[i];
      File imageFile = await ImageController().downloadAndSaveImage(musicData.cover, musicData.title + '.png');
        
      MusicDataLocal musicDataLocal = MusicDataLocal(
        id_music: musicData.id_music,
        title: musicData.title,
        artist_name: musicData.artist_name,
        genre: musicData.genre,
        duration: musicData.duration,
        release: musicData.release,
        cover: imageFile.path,
        music: musicData.music
      );

      await MusicDatabase().insertMusic(musicDataLocal);
    }
  }
}