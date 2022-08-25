class Film {
  final String title;
  late bool isFavorite;

  Film({
    required this.title,
    required this.isFavorite
  });

  factory Film.fromJson(Map<String, dynamic> json, bool isFavorite) {
    return Film(
      title: json['title'] as String,
      isFavorite: isFavorite
    );
  }
}