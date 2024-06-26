import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monie_point_task/bloc/search_proprty_bloc/search_propperty_bloc_bloc.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/propperty_screen/widgets/floating_action_button_widget.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/propperty_screen/widgets/map_place_place_holder_widget.dart';

class SearchProppertyScreen extends StatelessWidget {
  const SearchProppertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MapBloc>(context);

    return Scaffold(
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 800), 
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: MapPlaceholderWidget(iconType: state.iconType),
          );
        },
      ),
      floatingActionButton: FloatingActionButtonWidget(bloc: bloc),
    );
  }
}

