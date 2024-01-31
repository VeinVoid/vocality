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