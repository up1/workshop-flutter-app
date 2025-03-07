import 'dart:convert';
import 'package:flutter/widgets.dart';

class Beer {
  final int? id;
  final String name;
  final Color color;
  final int typeId;

  Beer({
    this.id,
    required this.name,
    required this.color,
    required this.typeId,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'color': color, 'breedId': typeId};
  }

  factory Beer.fromMap(Map<String, dynamic> map) {
    return Beer(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      color: Color(map['color']),
      typeId: map['typeId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Beer.fromJson(String source) => Beer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Beer(id: $id, name: $name, color: $color, typeId: $typeId)';
  }
}
