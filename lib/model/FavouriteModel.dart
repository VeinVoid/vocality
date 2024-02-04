class FavouriteData {
  final int id_favourite;
  final String title;
  final String artist_name;
  final String genre;
  final int duration;
  final String release;
  final String cover;
  final String music;

  FavouriteData({
    required this.id_favourite,
    required this.title,
    required this.artist_name,
    required this.genre,
    required this.duration,
    required this.release,
    required this.cover,
    required this.music,
  });

  factory FavouriteData.fromJson(Map<String, dynamic> json) {
    return FavouriteData(
      id_favourite: json['id_favourite'],
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
      'id_favourite': id_favourite,
      'title': title,
      'artist_name': artist_name,
      'genre': genre,
      'duration': duration,
      'release': release,
      'cover': cover,
      'music': music,
    };
  }

  factory FavouriteData.fromMap(Map<String, dynamic> map) {
    return FavouriteData(
      id_favourite: map['id_favourite'],
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