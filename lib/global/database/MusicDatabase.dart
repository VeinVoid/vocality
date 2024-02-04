import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vocality/model/MusicModel.dart';

class MusicDatabase {
  static Database? database;

  Future<Database> get musicDatabase async {
    if (database != null) return database!;

    database = await initMusicDatabase();
    return database!;
  }

  Future<Database> initMusicDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/music.db';

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => db.execute('''
        CREATE TABLE IF NOT EXISTS music (
          id_music INTEGER PRIMARY KEY AUTOINCREMENT,
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

  Future<int> insertMusic(MusicDataLocal musicData) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/music.db';
    final Database db = await openDatabase(path);
    
    List<Map<String, dynamic>> existingData = await db.query('music');
    if (existingData.length > 3) {
      await MusicDatabase().clearMusic();
    }
    
    return await db.insert('music', musicData.toMap());
  }

  Future<List<MusicDataLocal>> getMusics() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/music.db';
    final Database db = await openDatabase(path);
    final data = await db.query('music');
    List<MusicDataLocal> musicData = data.map((e) => MusicDataLocal.fromJson(e)).toList();
    
    return musicData;
  }

  Future<void> clearMusic() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final coverDirectory = Directory('${directory.path}/Cover');
    String path = directory.path + '/music.db';
    final Database db = await openDatabase(path);
    
    await db.delete('music');
    if (coverDirectory.existsSync()) {
      await for (var entity in coverDirectory.list()) {
        if (entity is File) {
          await entity.delete();
        }
      }
    }
  }
}