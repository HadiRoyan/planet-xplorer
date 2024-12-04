import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_xplorer/core/entities/planet_data.dart';
import 'package:planet_xplorer/data/model/planet_model.dart';
import 'package:planet_xplorer/data/repository/planet_repository.dart';

part 'planet_event.dart';
part 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  PlanetBloc({required PlanetRepository planetRepository})
      : _planetRepository = planetRepository,
        super(PlanetInitial()) {
    on<PlanetEvent>((event, emit) {});
    on<LoadPlanetEvent>(_loadPlanetHandler);
  }

  final PlanetRepository _planetRepository;

  Future<void> _loadPlanetHandler(
    PlanetEvent event,
    Emitter<PlanetState> emit,
  ) async {
    emit(PlanetLoading());

    try {
      PlanetData data = await _planetRepository.loadPlanetData();
      List<PlanetModel> planetModels = data.planetsData
          .map((planet) => PlanetModel.fromPlanetWithAsset(planet))
          .toList();

      // print(planetModels);
      emit(PlanetLoaded(planetModels));
    } catch (e) {
      // ignore: avoid_print
      print(e);
      emit(PlanetError('Failed to load planets'));
    }
  }
}
