// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:planet_xplorer/core/entities/planet_fact.dart';

class Planet {
  final String name;
  final String description;
  final double gravity;
  final double meanRadius;
  final int moons;
  final int avgTemp;
  final double orbitalPeriod;
  final double rotationPeriod;
  final List<PlanetFact> funFacts;

  Planet({
    required this.name,
    required this.description,
    required this.gravity,
    required this.meanRadius,
    required this.moons,
    required this.avgTemp,
    required this.orbitalPeriod,
    required this.rotationPeriod,
    required this.funFacts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'gravity': gravity,
      'meanRadius': meanRadius,
      'moons': moons,
      'avgTemp': avgTemp,
      'orbitalPeriod': orbitalPeriod,
      'rotationPeriod': rotationPeriod,
      'funFacts': funFacts.map((x) => x.toMap()).toList(),
    };
  }

  factory Planet.fromMap(Map<String, dynamic> map) {
    return Planet(
      name: map['name'] as String,
      description: map['description'] as String,
      gravity: (map['gravity'] as num).toDouble(),
      meanRadius: (map['meanRadius'] as num).toDouble(),
      moons: map['moons'] as int,
      avgTemp: map['avgTemp'] as int,
      orbitalPeriod: (map['orbitalPeriod'] as num).toDouble(),
      rotationPeriod: (map['rotationPeriod'] as num).toDouble(),
      funFacts: List<PlanetFact>.from(
        (map['funFacts'] as List<dynamic>).map<PlanetFact>(
          (x) => PlanetFact.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Planet.fromJson(String source) =>
      Planet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Planet('
        'name: $name, '
        'description: $description, '
        'gravity: $gravity, '
        'meanRadius: $meanRadius, '
        'moons: $moons, '
        'avgTemp: $avgTemp, '
        'orbitalPeriod: $orbitalPeriod, '
        'rotationPeriod: $rotationPeriod, '
        'funFacts: $funFacts'
        ')';
  }
}
