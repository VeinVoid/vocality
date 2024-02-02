import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocality/global/database/FavouriteDatabase.dart';
import 'package:vocality/global/database/MusicDatabase.dart';
import 'package:vocality/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MusicDatabase().initMusicDatabase();
    FavouriteDatabase().initFavouriteDatabase();
    return GetMaterialApp(
      title: 'Vocality',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}