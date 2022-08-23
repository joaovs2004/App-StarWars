class Character {
  final String name;

  const Character({
    required this.name,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] as String,
    );
  }
}