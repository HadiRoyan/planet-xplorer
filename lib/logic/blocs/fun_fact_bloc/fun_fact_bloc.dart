import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_xplorer/core/entities/planet_data.dart';
import 'package:planet_xplorer/data/model/planet_fact_model.dart';

part 'fun_fact_event.dart';
part 'fun_fact_state.dart';

class FunFactBloc extends Bloc<FunFactEvent, FunFactState> {
  FunFactBloc() : super(FunFactInitial()) {
    on<FunFactEvent>((event, emit) {});
    on<LoadListFunFact>(_loadListFunFactHandler);
  }

  Future<void> _loadListFunFactHandler(
    LoadListFunFact event,
    Emitter<FunFactState> emit,
  ) async {
    List<PlanetFactModel> listFacts = event.planetData.planets
        .expand(
          (planet) => planet.funFacts.map(
            (fact) => PlanetFactModel(
              planetName: planet.name,
              fact: fact,
            ),
          ),
        )
        .toList();

    // print("====> Fun Fact: $listFacts\n");
    List<PlanetFactModel> randomFunFact = (listFacts..shuffle()).take(5).toList();

    // print("====> Random Fun Fact: $randomFunFact");
    emit(FunFactLoaded(listFacts, randomFunFact));
  }
}
