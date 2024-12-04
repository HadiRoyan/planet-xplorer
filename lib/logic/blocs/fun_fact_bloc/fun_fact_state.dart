part of 'fun_fact_bloc.dart';

@immutable
sealed class FunFactState {}

final class FunFactInitial extends FunFactState {}

class FunFactLoading extends FunFactState {}

class FunFactLoaded extends FunFactState {
  final List<PlanetFactModel> listFunFact;
  final List<PlanetFactModel> randomFunFact;

  FunFactLoaded(this.listFunFact, this.randomFunFact);
}

class FunFactError extends FunFactState {
  final String message;

  FunFactError(this.message);
}