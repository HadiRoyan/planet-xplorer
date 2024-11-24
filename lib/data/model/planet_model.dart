// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:planet_xplorer/core/entities/planet.dart';

class PlanetModel {
  final String name;
  final double gravity;
  final double meanRadius;
  final int moons;
  final int avgTemp;
  final double orbitalPeriod;
  final double rotationPeriod;
  String? videoUrl;
  String? imageUrl;

  PlanetModel({
    required this.name,
    required this.gravity,
    required this.meanRadius,
    required this.moons,
    required this.avgTemp,
    required this.orbitalPeriod,
    required this.rotationPeriod,
    this.videoUrl,
    this.imageUrl,
  });

  void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }

  void setVideoUrl(String videoUrl) {
    this.videoUrl = videoUrl;
  }

  factory PlanetModel.fromPlanetWithAsset(Planet planet) {
    return PlanetModel(
      name: planet.name,
      gravity: planet.gravity,
      meanRadius: planet.meanRadius,
      moons: planet.moons,
      avgTemp: planet.avgTemp,
      orbitalPeriod: planet.orbitalPeriod,
      rotationPeriod: planet.rotationPeriod,
      videoUrl: 'assets/videos/${planet.name}.jpg',
      imageUrl: 'assets/images/${planet.name}.jpg',
    );
  }

  factory PlanetModel.fromPlanet(Planet planet) {
    return PlanetModel(
      name: planet.name,
      gravity: planet.gravity,
      meanRadius: planet.meanRadius,
      moons: planet.moons,
      avgTemp: planet.avgTemp,
      orbitalPeriod: planet.orbitalPeriod,
      rotationPeriod: planet.rotationPeriod,
    );
  }

  @override
  String toString() {
    return 'PlanetModel('
        'name: $name, '
        'gravity: $gravity, '
        'meanRadius: $meanRadius, '
        'moons: $moons, '
        'avgTemp: $avgTemp, '
        'orbitalPeriod: $orbitalPeriod, '
        'rotationPeriod: $rotationPeriod, '
        'videoUrl: $videoUrl, '
        'imageUrl: $imageUrl, '
        ')';
  }
}
