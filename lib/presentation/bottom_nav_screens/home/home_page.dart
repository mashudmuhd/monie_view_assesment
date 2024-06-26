import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/home/widgets/sliding_button_widget.dart';
import 'package:monie_point_task/presentation/bottom_nav_screens/home/widgets/sliver_box_adapter_widget.dart';
import 'package:monie_point_task/utils/contants.dart';
import 'package:monie_point_task/utils/resources/string_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFEFBA), Color(0xFFFFFFFF)],
                  ),
                ),
              ),
              expandedHeight: 80,
              floating: false,
              pinned: true,
              elevation: 0,
              title: AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  horizontalOffset: -200.0,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        width: 200,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.location_pin,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: AppStrings.searchText,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverBoxAdapterWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index % 2 == 0) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 800),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      'https://media.designcafe.com/wp-content/uploads/2020/02/21004842/indian-modern-kitchen-for-your-home.jpg',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                    const Positioned(
                                      bottom: 20,
                                      right: 20,
                                      left: 10,
                                      child: SlidingButton(
                                        maxContainerWidth: 355,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
                childCount: 10,
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 800),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://media.designcafe.com/wp-content/uploads/2022/09/07162345/kitchen-interior-design-cost.jpg',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                  const Positioned(
                                    bottom: 20,
                                    right: 20,
                                    left: 10,
                                    child: SlidingButton(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
