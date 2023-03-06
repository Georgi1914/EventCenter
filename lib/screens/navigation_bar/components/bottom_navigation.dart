import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global_variables.dart';
import '../../../presentation/color_manager.dart';
import '../nav_bar_view_model.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NavBarVM>();
    return BottomNavigationBar(
      onTap: (index) async {
        viewModel.changeSelectedPage(PageEnum.values[index]);
      },
      currentIndex: viewModel.selectedPage.index,
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
}
