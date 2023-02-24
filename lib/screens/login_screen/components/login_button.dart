import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../login_view_model.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 8, 60, 16),
      child: SizedBox(
        width: double.maxFinite,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            foregroundColor: AppColors.white,
            backgroundColor: AppColors.red,
            disabledBackgroundColor: AppColors.neutralsGray,
          ),
          onPressed: () async => await viewModel.signIn()
              ? Navigator.pushNamed(context, RouteManager.homeScreen)
              : ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      viewModel.exceptionText.isEmpty
                          ? AppStrings.invalidCredentials
                          : viewModel.exceptionText,
                    ),
                  ),
                ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              AppStrings.signIn,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}
