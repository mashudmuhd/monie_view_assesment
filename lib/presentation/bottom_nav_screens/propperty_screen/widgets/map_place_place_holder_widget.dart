import 'package:flutter/material.dart';

class MapPlaceholderWidget extends StatelessWidget {
  final String iconType;

  const MapPlaceholderWidget({Key? key, required this.iconType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    final EdgeInsets padding;

    if (iconType == 'flat_house') {
      child = const Text("13,3 mp P", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold));
      padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 15);
    } else {
      child = const Icon(Icons.apartment, color: Colors.white);
      padding = const EdgeInsets.all(20);
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/originals/42/60/03/426003878e05c80253c94bacefa38510.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 200,
            left: 50,
            child: MapInformationContainer(
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
          Positioned(
            top: 400,
            right: 50,
            child: MapInformationContainer(
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 50,
            child: MapInformationContainer(
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
          Positioned(
            top: 300,
            right: 50,
            child: MapInformationContainer(
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapInformationContainer extends StatelessWidget {
  final Widget child;

  const MapInformationContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
