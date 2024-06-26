import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monie_point_task/bloc/navigation_bar_bloc_bloc.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/chat_screen.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/favourite_screen.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/home/home_page.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/profile_screen.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/propperty_screen/search_propperty_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              _getBodyWidget(context, state),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                  0.0,
                  state is BottomNavigationStateInitial ? 0.0 : 0.0, 
                  0.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.black87,
                        elevation: 0,
                        currentIndex: _getCurrentIndex(state),
                        onTap: (index) {
                          BlocProvider.of<NavigationBloc>(context).add(SelectTabEvent(index));
                        },
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.white,
                        type: BottomNavigationBarType.fixed,
                        items: [
                          _buildBottomNavigationBarItem(Icons.search_outlined, 0, state),
                          _buildBottomNavigationBarItem(Icons.message, 1, state),
                          _buildBottomNavigationBarItem(Icons.home_outlined, 2, state),
                          _buildBottomNavigationBarItem(Icons.favorite, 3, state),
                          _buildBottomNavigationBarItem(Icons.person, 4, state),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, int index, BottomNavigationState state) {
    bool isSelected = _getCurrentIndex(state) == index;

    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: isSelected
            ? const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              )
            : const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
        child: Icon(
          icon,
          size: 20.0,
        ),
      ),
      label: "",
    );
  }

  Widget _getBodyWidget(BuildContext context, BottomNavigationState state) {
    if (state is BottomNavigationStateInitial) {
      return const HomeScreen();
    } else if (state is BottomNavIndexChanged) {
      switch (state.selectedIndex) {
        case 0:
          return const SearchProppertyScreen();
        case 1:
          return const ChatScreen();
        case 2:
          return const HomeScreen();
        case 3:
          return const FavouriteScreen();
        case 4:
          return const ProfileScreen();
        default:
          return Container();
      }
    } else {
      return Container();
    }
  }

  int _getCurrentIndex(BottomNavigationState state) {
    if (state is BottomNavigationStateInitial) {
      return 0;
    } else if (state is BottomNavIndexChanged) {
      return state.selectedIndex;
    } else {
      return 0;
    }
  }
}
