import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/get_it.dart';
import '../../../app/viewmodel_builder.dart';
import '../../../global_variables.dart';
import '../../favorite_screen/favorite_view.dart';
import '../../favorite_screen/favorite_view_model.dart';
import '../../home/home_screen.dart';
import '../../home/home_viewmodel.dart';
import '../nav_bar_view_model.dart';

class NavBarBody extends StatelessWidget {
  const NavBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    switch (context.watch<NavBarVM>().selectedPage) {
      case PageEnum.home:
        return ViewModelBuilder<HomeVM>(
          builder: (context, viewModel) => const HomeScreen(),
          viewModelBuilder: getIt<HomeVM>,
          onModelReady: (viewModel) => viewModel.init(),
        );
      case PageEnum.favorites:
        return ViewModelBuilder<FavoriteVM>(
          builder: (context, viewModel) => const FavoriteScreen(),
          viewModelBuilder: getIt<FavoriteVM>,
          onModelReady: (viewModel) => viewModel.init(),
        );

      // case PageEnum.profile:
      //   return ChangeNotifierProvider<ProfileViewModel>(
      //     create: (_) => ProfileViewModel(),
      //     child: const ProfilePage(),
      //   );
    }
  }
}
