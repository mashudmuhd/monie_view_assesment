import 'package:bloc/bloc.dart';

part 'search_propperty_bloc_event.dart';
part 'search_propperty_bloc_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState(iconType: 'flat_house')) {
    on<ChangeIconEvent>((event, emit) {
      emit(MapState(iconType: event.iconType));
    });
  }
}
