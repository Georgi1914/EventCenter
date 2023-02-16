import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/register_screen/register_view.dart';
import '../screens/register_screen/register_view_model.dart';
import 'get_it.dart';
import 'viewmodel_builder.dart';

class RouteManager {
  static const String homeScreen = 'home-screen';
  static const String registerScreen = 'register-screen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ViewModelBuilder<HomeVM>(
            builder: (context, viewModel) => const HomeScreen(),
            viewModelBuilder: getIt<HomeVM>,
            onModelReady: (viewModel) => viewModel.init(),
          ),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              ViewModelBuilder<RegisterViewModel>(
            builder: (context, viewModel) => const RegisterView(),
            viewModelBuilder: getIt<RegisterViewModel>,
          ),
        );
      default:
        throw Exception('Invalid route');
    }
  }
}
