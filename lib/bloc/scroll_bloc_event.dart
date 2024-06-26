part of 'scroll_bloc_bloc.dart';

abstract class ScrollEvent extends Equatable {
  const ScrollEvent();

  @override
  List<Object> get props => [];
}

class ScrollUpdated extends ScrollEvent {
  final double scrollPosition;
  final double maxScrollExtent;

  const ScrollUpdated(this.scrollPosition, this.maxScrollExtent);

  @override
  List<Object> get props => [scrollPosition, maxScrollExtent];
}