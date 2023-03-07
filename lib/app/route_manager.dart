import 'package:flutter/material.dart';

import '../models/ui/event.dart';
import '../screens/create_event_screen/create_event_view.dart';
import '../screens/create_event_screen/create_event_view_model.dart';
import '../screens/description_screen/description_view.dart';
import '../screens/description_screen/description_view_model.dart';
import '../screens/login_screen/login_view.dart';
import '../screens/login_screen/login_view_model.dart';
import '../screens/navigation_bar/nav_bar_view.dart';
import '../screens/navigation_bar/nav_bar_view_model.dart';
import '../screens/register_screen/register_view.dart';
import '../screens/register_screen/register_view_model.dart';
import 'get_it.dart';
import 'viewmodel_builder.dart';

class RouteManager {
  // static const String homeScreen = 'home-screen';
  static const String registerScreen = 'register-screen';
  static const String logInScreen = 'login-screen';
  static const String descriptionScreen = 'description-screen';
  // static const String favoritesScreen = 'favorites-screen';
  static const String navigation = 'navigation';
  static const String createEvent = 'create-event-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case homeScreen:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => ViewModelBuilder<HomeVM>(
      //       builder: (context, viewModel) => const HomeScreen(),
      //       viewModelBuilder: getIt<HomeVM>,
      //       onModelReady: (viewModel) => viewModel.init(),
      //     ),
      //   );
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
      // case favoritesScreen:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => ViewModelBuilder<FavoriteVM>(
      //       builder: (context, viewModel) => const FavoriteScreen(),
      //       viewModelBuilder: getIt<FavoriteVM>,
      //       onModelReady: (viewModel) => viewModel.init(),
      //     ),
      //   );
      case navigation:
        return MaterialPageRoute(
          builder: (BuildContext context) => ViewModelBuilder<NavBarVM>(
            builder: (context, viewModel) => const NavBarView(),
            viewModelBuilder: getIt<NavBarVM>,
          ),
        );
      case createEvent:
        return MaterialPageRoute(
          builder: (BuildContext context) => ViewModelBuilder<CreateEventVM>(
            builder: (context, viewModel) => const CreateEventScreen(),
            viewModelBuilder: getIt<CreateEventVM>,
          ),
        );
      default:
        throw Exception('Invalid route');
    }
  }
}
