import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/padding_manager.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVM>();
    return Scaffold(
      body: ColoredBox(
        color: Colors.red,
        child: SafeArea(
          child: ColoredBox(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: PaddingManager.p1,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          //todo Fetch the image from db
                          'https://img.favpng.com/7/7/21/pfc-levski-sofia-bc-levski-sofia-pfc-lokomotiv-plovdiv-first-professional-football-league-png-favpng-LqV2xLbsMkmrGgwi99kMSxf3D.jpg',
                        ),
                        minRadius: 24,
                      ),
                      Column(
                        children: const [
                          //todo Fetch from db
                          Text('Good morning'),
                          Text('Name SecondName'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
