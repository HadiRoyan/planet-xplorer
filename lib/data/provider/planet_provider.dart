import 'package:flutter/services.dart';
import 'package:planet_xplorer/core/entities/planet_data.dart';

class PlanetProvider {
  Future<PlanetData> loadPlanetData() async {
    String planetJson = await rootBundle.loadString(
      'assets/json/planets.json',
    );

    PlanetData data = PlanetData.fromJson(planetJson);
    return data;
  }
}
