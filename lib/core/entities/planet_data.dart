import 'dart:convert';

import 'package:planet_xplorer/core/entities/metadata.dart';
import 'package:planet_xplorer/core/entities/planet.dart';

class PlanetData {
  final List<Planet> planetsData;
  final List<String> categories;
  final Metadata metadata;

  PlanetData({
    required this.planetsData,
    required this.categories,
    required this.metadata,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'planetsData': planetsData.map((x) => x.toMap()).toList(),
      'categories': categories,
      'metadata': metadata.toMap(),
    };
  }

  factory PlanetData.fromMap(Map<String, dynamic> map) {
    return PlanetData(
      planetsData: List<Planet>.from(
        (map['planetsData'] as List<dynamic>).map<Planet>(
          (x) => Planet.fromMap(x as Map<String, dynamic>),
        ),
      ),
      categories: List<String>.from(
        (map['categories'] as List<dynamic>),
      ),
      metadata: Metadata.fromMap(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanetData.fromJson(String source) =>
      PlanetData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PlanetData(planetsData: $planetsData, categories: $categories, metadata: $metadata)';
}
