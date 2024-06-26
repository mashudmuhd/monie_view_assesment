part of 'navigation_bar_bloc_bloc.dart';

class BottomNavigationState {
  
}

class BottomNavigationStateInitial extends BottomNavigationState{
  
}

class BottomNavIndexChanged extends BottomNavigationState{
  final int selectedIndex;
  
  BottomNavIndexChanged(this.selectedIndex);

}