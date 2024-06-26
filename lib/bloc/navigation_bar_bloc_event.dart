part of 'navigation_bar_bloc_bloc.dart';

abstract class BottomNavigationEvent {}

class SelectTabEvent extends BottomNavigationEvent {
  final int tabIndex;
  SelectTabEvent(this.tabIndex);
}