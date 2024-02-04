import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vocality/model/FavouriteModel.dart';


class FavouriteDatabase {
  static Database? database;

  Future<Database> get favouriteDatabase async {
    if (database != null) return database!;

    database = await initFavouriteDatabase();
    return database!;
  }

  Future<Database> initFavouriteDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/favourite.db';

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => db.execute('''
        CREATE TABLE favourite (
          id_favourite INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          artist_name TEXT,
          genre TEXT,
          duration INTEGER,
          release TEXT,
          cover TEXT,
          music TEXT
        )
      '''),
    );
  }

  Future<int> insertFavourite(FavouriteData favouriteData) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/favourite.db';
    final Database db = await openDatabase(path);

    return await db.insert('favourite', favouriteData.toMap());
  }

  Future<List<FavouriteData>> getFavourites() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/favourite.db';
    final Database db = await openDatabase(path);
    final List<Map<String, dynamic>> maps = await db.query('favourite');

    return List.generate(maps.length, (i) {
      return FavouriteData.fromJson(maps[i]);
    });
  }

  Future<int> updateFavourite(int id, String coverPath) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/favourite.db';
    final Database db = await openDatabase(path);

    return await db.update(
      'favourite',
      {'cover': coverPath},
      where: 'id_favourite = ?',
      whereArgs: [id],
    );
  }


  Future<void> clearFavourite() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/favourite.db';
    final Database db = await openDatabase(path);

    await db.delete('favourite');
  }
}