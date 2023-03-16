import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/get_it.dart';
import '../../../app/viewmodel_builder.dart';
import '../../../global_variables.dart';
import '../../favorite_screen/favorite_view.dart';
import '../../favorite_screen/favorite_view_model.dart';
import '../../home/home_screen.dart';
import '../../home/home_viewmodel.dart';
import '../../profile_screen/profile_view.dart';
import '../../profile_screen/profile_view_model.dart';
import '../nav_bar_view_model.dart';

class NavBarBody extends StatelessWidget {
  const NavBarBody({required this.isUser, super.key});

  final bool isUser;

  @override
  Widget build(BuildContext context) {
    switch (context.watch<NavBarVM>().selectedPage) {
      case PageEnum.home:
        return ViewModelBuilder<HomeVM>(
          builder: (context, viewModel) => const HomeScreen(),
          viewModelBuilder: getIt<HomeVM>,
          onModelReady: (viewModel) => viewModel.init(isUser),
        );
      case PageEnum.favorites:
        return ViewModelBuilder<FavoriteVM>(
          builder: (context, viewModel) => const FavoriteScreen(),
          viewModelBuilder: getIt<FavoriteVM>,
          onModelReady: (viewModel) => viewModel.init(),
        );
      case PageEnum.profile:
        return ChangeNotifierProvider<ProfileVM>(
          create: (_) => getIt<ProfileVM>(),
          child: ProfileScreen(isUser: isUser),
        );
    }
  }
}
