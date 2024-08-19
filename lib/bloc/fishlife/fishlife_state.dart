part of 'fishlife_bloc.dart';

@immutable
sealed class FishlifeState {
  final double hunger;
  final double reproduce;

  const FishlifeState({required this.reproduce, required this.hunger});
}

final class FishlifeInitial extends FishlifeState {
  const FishlifeInitial() : super(hunger: 100, reproduce: 0);
}

final class HappyState extends FishlifeState {
  const HappyState({required super.reproduce, required super.hunger});
}

final class HungryState extends FishlifeState {
  const HungryState({required super.reproduce, required super.hunger});
}

final class ReproduceState extends FishlifeState {
  const ReproduceState({required super.reproduce, required super.hunger});
}
