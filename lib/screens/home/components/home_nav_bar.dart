import 'package:flutter/material.dart';

import '../../../app/auth/local_storage.dart';
import '../../../app/get_it.dart';
import '../../../app/route_manager.dart';
import '../../../presentation/color_manager.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        onTap: (index) async {
          await getIt<LocalStorage>().removeToken();
          await Navigator.pushNamedAndRemoveUntil(context,
              RouteManager.logInScreen, (Route<dynamic> route) => false);
        },
        unselectedLabelStyle: const TextStyle(color: AppColors.white),
        unselectedItemColor: AppColors.white,
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.primaryPurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
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
      );
}
