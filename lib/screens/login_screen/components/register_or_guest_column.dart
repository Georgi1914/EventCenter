import 'package:flutter/material.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/string_manager.dart';
import 'custom_elevated_button.dart';
import 'wrapped_in_dividers_text.dart';

class RegisterOrGuestColumn extends StatelessWidget {
  const RegisterOrGuestColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            text: AppStrings.signUp,
            navigation: () =>
                Navigator.pushNamed(context, RouteManager.registerScreen),
          ),
          const WrappedInDividersText(text: AppStrings.or),
          CustomElevatedButton(
            text: AppStrings.continueAsGuest,
            navigation: () => Navigator.pushNamed(
                context, RouteManager.navigation,
                arguments: false),
          ),
        ],
      );
}
