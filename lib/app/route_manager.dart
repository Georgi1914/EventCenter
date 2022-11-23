import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/home/home_viewmodel.dart';
import 'get_it.dart';
import 'viewmodel_builder.dart';

class RouteManager {
  static const String homePage = 'home-page';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (BuildContext context) => ViewModelBuilder<HomeVM>(
            builder: (context, viewModel) => const HomeScreen(),
            viewModelBuilder: getIt<HomeVM>,
            onModelReady: (viewModel) => viewModel.init(),
          ),
        );
      default:
        throw Exception('Invalid route');
    }
  }
}
