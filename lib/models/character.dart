class Character {
  final String name;
  late bool isFavorite;

  Character({
    required this.name,
    required this.isFavorite
  });

  factory Character.fromJson(Map<String, dynamic> json, bool isFavorite) {
    return Character(
      name: json['name'] as String,
      isFavorite: isFavorite
    );
  }
}