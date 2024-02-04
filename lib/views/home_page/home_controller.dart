import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocality/global/database/FavouriteDatabase.dart';
import 'package:vocality/global/helper/ImageDownloader.dart';
import 'package:vocality/model/FavouriteModel.dart';

class HomePageController extends GetxController {
  
  Future<void> addFavoutite({
    required musicData
  }) async {
    if (!musicData.cover.endsWith('.png')) {
      FavouriteData favouriteData = FavouriteData(
        id_favourite: musicData.id_music,
        title: musicData.title,
        artist_name: musicData.artist_name,
        genre: musicData.genre,
        duration: musicData.duration,
        release: musicData.release,
        cover: musicData.cover,
        music: musicData.music
      );
      FavouriteDatabase().insertFavourite(favouriteData);
      File imageFile = await ImageController().downloadAndSaveImage(musicData.cover, musicData.title + '.png');
      FavouriteDatabase().updateFavourite(favouriteData.id_favourite, imageFile.path);
    } else {
      FavouriteData favouriteData = FavouriteData(
        id_favourite: musicData.id_music,
        title: musicData.title,
        artist_name: musicData.artist_name,
        genre: musicData.genre,
        duration: musicData.duration,
        release: musicData.release,
        cover: musicData.cover,
        music: musicData.music
      );
      print("isNotDownload");
      FavouriteDatabase().insertFavourite(favouriteData);
    }
  }
}