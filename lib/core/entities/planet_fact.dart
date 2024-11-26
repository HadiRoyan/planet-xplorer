// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlanetFact {
  final int id;
  final String fact;
  final String category;

  PlanetFact({
    required this.id,
    required this.fact,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fact': fact,
      'category': category,
    };
  }

  factory PlanetFact.fromMap(Map<String, dynamic> map) {
    return PlanetFact(
      id: map['id'] as int,
      fact: map['fact'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanetFact.fromJson(String source) =>
      PlanetFact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PlanetFact(id: $id, fact: $fact, category: $category)';
}
