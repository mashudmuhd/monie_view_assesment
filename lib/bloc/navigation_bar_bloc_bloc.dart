import 'package:bloc/bloc.dart';
part 'navigation_bar_bloc_event.dart';
part 'navigation_bar_bloc_state.dart';

class NavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  NavigationBloc() : super(BottomNavigationStateInitial()) {
    on<BottomNavigationEvent>((event, emit) {
      if (event is SelectTabEvent) {
        emit(BottomNavIndexChanged(event.tabIndex));
      }
    });
  }
}
