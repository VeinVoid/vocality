//For data from API
class MusicData {
  final int id_music;
  final String title;
  final String artist_name;
  final String genre;
  final int duration;
  final String release;
  final String cover;
  final String music;

  MusicData({
    required this.id_music,
    required this.title,
    required this.artist_name,
    required this.genre,
    required this.duration,
    required this.release,
    required this.cover,
    required this.music,
  });

  factory MusicData.fromJson(Map<String, dynamic> json) {
    return MusicData(
      id_music: json['id_music'],
      title: json['title'],
      artist_name: json['artist_name'],
      genre: json['genre'],
      duration: json['duration'],
      release: json['release'],
      cover: json['cover'],
      music: json['music'],
    );
  }
}

//For data from local database
class MusicDataLocal {
  final int id_music;
  final String title;
  final String artist_name;
  final String genre;
  final int duration;
  final String release;
  final String cover;
  final String music;

  MusicDataLocal({
    required this.id_music,
    required this.title,
    required this.artist_name,
    required this.genre,
    required this.duration,
    required this.release,
    required this.cover,
    required this.music,
  });

  factory MusicDataLocal.fromJson(Map<String, dynamic> json) {
    return MusicDataLocal(
      id_music: json['id_music'],
      title: json['title'],
      artist_name: json['artist_name'],
      genre: json['genre'],
      duration: json['duration'],
      release: json['release'],
      cover: json['cover'],
      music: json['music'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_music': id_music,
      'title': title,
      'artist_name': artist_name,
      'genre': genre,
      'duration': duration,
      'release': release,
      'cover': cover,
      'music': music,
    };
  }

  factory MusicDataLocal.fromMap(Map<String, dynamic> map) {
    return MusicDataLocal(
      id_music: map['id'],
      title: map['title'],
      artist_name: map['artist_name'],
      genre: map['genre'],
      duration: map['duration'],
      release: map['release'],
      cover: map['cover'],
      music: map['music'],
    );
  }
}