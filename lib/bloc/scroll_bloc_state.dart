part of 'scroll_bloc_bloc.dart';

class ScrollState {
  final bool showAppBar;
  final bool showBottomBar;
  ScrollState(this.showAppBar,this.showBottomBar);

   List<Object> get props => [showAppBar, showBottomBar];
}
