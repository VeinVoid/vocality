class FavouriteData {
  final int id_favourite;
  final String title;
  final String artist_name;
  final String cover_path;

  FavouriteData({
    required this.id_favourite,
    required this.title,
    required this.artist_name,
    required this.cover_path,
  });

  factory FavouriteData.fromJson(Map<String, dynamic> json) {
    return FavouriteData(
      id_favourite: json['id_favourite'],
      title: json['title'],
      artist_name: json['artist_name'],
      cover_path: json['cover_path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_favourite': id_favourite,
      'title': title,
      'artist_name': artist_name,
      'cover_path': cover_path,
    };
  }

  factory FavouriteData.fromMap(Map<String, dynamic> map) {
    return FavouriteData(
      id_favourite: map['id_favourite'],
      title: map['title'],
      artist_name: map['artist_name'],
      cover_path: map['cover_path'],
    );
  }
}