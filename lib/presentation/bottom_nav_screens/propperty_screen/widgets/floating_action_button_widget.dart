  import 'package:flutter/material.dart';
import 'package:monie_point_task/bloc/search_proprty_bloc/search_propperty_bloc_bloc.dart';
import 'package:monie_point_task/utils/resources/string_manager.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.bloc,
  });

  final MapBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black54,
                shape: const CircleBorder(),
                onPressed: () {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      0.0,
                      MediaQuery.of(context).size.height - 300,
                      400,
                      400,
                    ),
                    items: [
                      PopupMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              bloc.add(ChangeIconEvent(AppStrings.faltHouseText));
                              Navigator.pop(context);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.apartment_outlined),
                                SizedBox(width: 5,),
                                Text(AppStrings.faltHouseText),
                              ],
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              bloc.add(ChangeIconEvent(AppStrings.villaText));
                              Navigator.pop(context);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.apartment),
                                SizedBox(width: 5,),
                                Text(AppStrings.villaText),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                child: const Icon(Icons.send, color: Colors.white,),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: Colors.black54,
                onPressed: () {
                  
                },
                child: const Icon(Icons.add, color: Colors.white,),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton.extended(
            backgroundColor: Colors.black54,
            onPressed: () {
              
            },
            label: const Text(AppStrings.listOFvarientText, style: TextStyle(color: Colors.white),),
            icon: const Icon(Icons.list, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}

