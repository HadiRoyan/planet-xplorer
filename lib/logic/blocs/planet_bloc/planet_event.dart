part of 'planet_bloc.dart';

@immutable
sealed class PlanetEvent {}

class LoadPlanetEvent extends PlanetEvent {}