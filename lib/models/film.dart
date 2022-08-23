class Film {
  final String title;

  const Film({
    required this.title,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'] as String,
    );
  }
}