import 'package:flutter/material.dart';

import '../models/ui/event.dart';
import '../screens/description_screen/description_view.dart';
import '../screens/description_screen/description_view_model.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/login_screen/login_view.dart';
import '../screens/login_screen/login_view_model.dart';
import '../screens/register_screen/register_view.dart';
import '../screens/register_screen/register_view_model.dart';
import 'get_it.dart';
import 'viewmodel_builder.dart';

class RouteManager {
  static const String homeScreen = 'home-screen';
  static const String registerScreen = 'register-screen';
  static const String logInScreen = 'login-screen';
  static const String descriptionScreen = 'description-screen';
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
      case logInScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ViewModelBuilder<LoginViewModel>(
            builder: (context, viewModel) => const LoginView(),
            viewModelBuilder: getIt<LoginViewModel>,
          ),
        );
      case descriptionScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ViewModelBuilder<DescriptionVM>(
            builder: (context, viewModel) => DescriptionScreen(
              event: settings.arguments as DomainEvent,
            ),
            viewModelBuilder: getIt<DescriptionVM>,
          ),
        );
      default:
        throw Exception('Invalid route');
    }
  }
}
