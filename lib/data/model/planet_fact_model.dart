// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planet_xplorer/core/entities/planet_fact.dart';

class PlanetFactModel {
  final String planetName;
  final PlanetFact fact;

  PlanetFactModel({required this.planetName, required this.fact});

  @override
  String toString() => 'PlanetFactModel(planetName: $planetName, fact: $fact)';
}
