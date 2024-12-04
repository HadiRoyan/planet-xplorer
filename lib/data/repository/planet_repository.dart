import 'package:planet_xplorer/core/entities/planet_data.dart';
import 'package:planet_xplorer/data/provider/planet_provider.dart';

class PlanetRepository {

  final PlanetProvider planetProvider;

  PlanetRepository({required this.planetProvider});

  Future<PlanetData> loadPlanetData() async {
    return planetProvider.loadPlanetData();
  }
}