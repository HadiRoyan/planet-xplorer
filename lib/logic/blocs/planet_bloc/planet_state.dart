part of 'planet_bloc.dart';

@immutable
sealed class PlanetState {}

final class PlanetInitial extends PlanetState {}

class PlanetLoading extends PlanetState {}

class PlanetLoaded extends PlanetState {
  final List<PlanetModel> planetModels;

  PlanetLoaded(this.planetModels);
}

class PlanetError extends PlanetState {
  final String message;

  PlanetError(this.message);
}