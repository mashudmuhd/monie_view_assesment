import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monie_point_task/bloc/navigation_bar_bloc_bloc.dart';
import 'package:monie_point_task/bloc/scroll_bloc_bloc.dart';
import 'package:monie_point_task/bloc/search_proprty_bloc/search_propperty_bloc_bloc.dart';
import 'package:monie_point_task/presentation/main_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ScrollBloc()),
          BlocProvider(create: (context) => NavigationBloc()),
          BlocProvider<MapBloc>(create: (BuildContext context) => MapBloc()),
        ],
        child:  const MainScreen(), 
      ),
    );
  }
}



class IconWithHighlight extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const IconWithHighlight({super.key, required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selected ? Colors.orange : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon),
    );
  }
}

