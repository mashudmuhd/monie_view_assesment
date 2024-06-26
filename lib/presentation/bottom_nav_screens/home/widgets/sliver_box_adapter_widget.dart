import 'package:flutter/material.dart';

class SliverBoxAdapterWidget extends StatelessWidget {
  const SliverBoxAdapterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hi, Marina",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const Text(
                "Let's Select your \nperfect place",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'BUY',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TweenAnimationBuilder<int>(
                                tween: IntTween(
                                    begin: 10,
                                    end:
                                        1034),
                                duration: const Duration(
                                    seconds:
                                        2), 
                                builder: (BuildContext context,
                                    int value, Widget? child) {
                                  return Text(
                                    '$value',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(top: 60),
                                child: Text(
                                  'OFFER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    
                    // Rounded Container with Text
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child:  Padding(
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'RENT',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child:TweenAnimationBuilder<int>(
                                tween: IntTween(
                                    begin: 10,
                                    end:
                                        1026),
                                duration: const Duration(
                                    seconds:
                                        2), 
                                builder: (BuildContext context,
                                    int value, Widget? child) {
                                  return Text(
                                    '$value',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(top: 60),
                                child: Text(
                                  'Offers',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

