import 'dart:convert';

class BeerType {
  final int? id;
  final String name;
  final String description;

  BeerType({this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description};
  }

  factory BeerType.fromMap(Map<String, dynamic> map) {
    return BeerType(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BeerType.fromJson(String source) =>
      BeerType.fromMap(json.decode(source));

  @override
  String toString() => 'Breed(id: $id, name: $name, description: $description)';
}
