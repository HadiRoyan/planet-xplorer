import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_xplorer/core/entities/planet.dart';
import 'package:planet_xplorer/data/model/planet_model.dart';

part 'planet_event.dart';
part 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  PlanetBloc() : super(PlanetInitial()) {
    on<PlanetEvent>((event, emit) {});
    on<LoadPlanetEvent>(_loadPlanetHandler);
  }

  Future<void> _loadPlanetHandler(
    PlanetEvent event,
    Emitter<PlanetState> emit,
  ) async {
    emit(PlanetLoading());

    try {
      final String planetJson = await rootBundle.loadString(
        'assets/json/planets.json',
      );

      List<dynamic> data = json.decode(planetJson);

      List<Planet> planets = data
          .map((item) => Planet.fromMap(item as Map<String, dynamic>))
          .toList();

      List<PlanetModel> planetModels =
          planets.map((planet) => PlanetModel.fromPlanetWithAsset(planet))
          .toList();

      print(planetModels);
      emit(PlanetLoaded(planetModels));
    } catch (e) {
      // ignore: avoid_print
      print(e);
      emit(PlanetError('Failed to load planets'));
    }
  }
}
