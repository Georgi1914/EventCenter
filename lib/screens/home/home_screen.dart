import 'package:flutter/material.dart';

import '../../presentation/color_manager.dart';
import 'components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: AppColors.white),
          unselectedItemColor: AppColors.white,
          backgroundColor: AppColors.backgroundColor,
          selectedItemColor: AppColors.primaryPurple,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            )
          ],
        ),
        backgroundColor: AppColors.backgroundColor,
        body: const HomeScreenBody(),
      );
}
