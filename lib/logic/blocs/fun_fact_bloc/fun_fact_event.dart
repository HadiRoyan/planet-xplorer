part of 'fun_fact_bloc.dart';

@immutable
sealed class FunFactEvent {}

class LoadListFunFact extends FunFactEvent {
  final PlanetData planetData;

  LoadListFunFact({required this.planetData});
}