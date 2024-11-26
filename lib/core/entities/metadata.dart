// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Metadata {
  final String version;
  final String lastUpdated;
  final int totalPlanets;
  final int totalFacts;

  Metadata({
    required this.version,
    required this.lastUpdated,
    required this.totalPlanets,
    required this.totalFacts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'lastUpdated': lastUpdated,
      'totalPlanets': totalPlanets,
      'totalFacts': totalFacts,
    };
  }

  factory Metadata.fromMap(Map<String, dynamic> map) {
    return Metadata(
      version: map['version'] as String,
      lastUpdated: map['lastUpdated'] as String,
      totalPlanets: map['totalPlanets'] as int,
      totalFacts: map['totalFacts'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Metadata.fromJson(String source) => Metadata.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Metadata(version: $version, lastUpdated: $lastUpdated, totalPlanets: $totalPlanets, totalFacts: $totalFacts)';
  }
}
