import 'package:flutter/material.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/string_manager.dart';

class RegisterOrGuestRow extends StatelessWidget {
  const RegisterOrGuestRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'registerBtn',
            onPressed: () =>
                Navigator.pushNamed(context, RouteManager.registerScreen),
            child: const Text(AppStrings.signUp),
          ),
          FloatingActionButton(
            heroTag: 'homeBtn',
            onPressed: () =>
                Navigator.pushNamed(context, RouteManager.homeScreen),
            child: const Text(AppStrings.continueAsGuest),
          ),
        ],
      );
}
