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
    String path = directory.path + 'music.db';

    bool databaseExists = await databaseFactory.databaseExists(path);

    if (!databaseExists) {
      return openDatabase(
        path,
        version: 1,
        onCreate: createMusicTable,
      );
      
    } else {
      return openDatabase(path);
    }
  }

   Future<void> createMusicTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE music (
        id_music INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        artist_name TEXT,
        cover TEXT
      )
    ''');
  }

  Future<int> insertMusic(MusicDataLocal musicData) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'music.db';
    final Database db = await openDatabase(path);
    
    List<Map<String, dynamic>> existingData = await db.query('music');
    if (existingData.isNotEmpty) {
      await MusicDatabase().clearMusic();
    }
    
    return await db.insert('music', musicData.toMap());
  }

  Future<List<MusicDataLocal>> getMusics() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'music.db';
    final Database db = await openDatabase(path);
    final List<Map<String, dynamic>> maps = await db.query('music');

    return List.generate(maps.length, (i) {
      return MusicDataLocal.fromJson(maps[i]);
    });
  }

  Future<void> clearMusic() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final coverDirectory = Directory('${directory.path}/Cover');
    String path = directory.path + 'music.db';
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