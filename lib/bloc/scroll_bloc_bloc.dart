import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scroll_bloc_event.dart';
part 'scroll_bloc_state.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollState(false, false)) {
    on<ScrollUpdated>((event, emit) {
      final maxScroll = event.maxScrollExtent;
      final currentScroll = event.scrollPosition;
      final shouldShowBottomBar = maxScroll == currentScroll;
      emit(ScrollState(currentScroll > 0, shouldShowBottomBar));
    });
  }
}
