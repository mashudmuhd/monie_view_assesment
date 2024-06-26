part of 'search_propperty_bloc_bloc.dart';

abstract class MapEvent {}

class ChangeIconEvent extends MapEvent {
  final String iconType;

  ChangeIconEvent(this.iconType);
}

