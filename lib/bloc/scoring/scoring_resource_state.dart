// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scoring_resource_bloc.dart';

@immutable
sealed class ScoringResourceState {}

class ScoringResourceInitial extends ScoringResourceState {}

class ScoringResourceState2 extends ScoringResourceState {
  final double smallFishes;
  final double sharks;
  final double seaweeds;
  ScoringResourceState2({
    this.smallFishes = 0,
    this.sharks = 0,
    this.seaweeds = 0,
  });

  ScoringResourceState2 copyWith({
    double? smallFishes,
    double? sharks,
    double? seaweeds,
  }) {
    return ScoringResourceState2(
      smallFishes: smallFishes ?? this.smallFishes,
      sharks: sharks ?? this.sharks,
      seaweeds: seaweeds ?? this.seaweeds,
    );
  }

  @override
  bool operator ==(covariant ScoringResourceState2 other) {
    if (identical(this, other)) return true;

    return other.smallFishes == smallFishes &&
        other.sharks == sharks &&
        other.seaweeds == seaweeds;
  }

  @override
  int get hashCode =>
      smallFishes.hashCode ^ sharks.hashCode ^ seaweeds.hashCode;
}
