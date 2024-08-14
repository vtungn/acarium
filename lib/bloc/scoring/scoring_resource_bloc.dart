import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scoring_resource_event.dart';
part 'scoring_resource_state.dart';

class ScoringResourceBloc
    extends Bloc<ScoringResourceEvent, ScoringResourceState> {
  ScoringResourceBloc() : super(ScoringResourceInitial()) {
    on<ScoringResourceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
