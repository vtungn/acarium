import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fishlife_event.dart';
part 'fishlife_state.dart';

class FishlifeBloc extends Bloc<FishlifeEvent, FishlifeState> {
  FishlifeBloc() : super(const FishlifeInitial()) {
    on<FishlifeEvent>((event, emit) {});
  }
}
