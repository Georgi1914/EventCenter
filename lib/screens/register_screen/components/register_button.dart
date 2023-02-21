import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../register_view_model.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegisterViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
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
          onPressed: viewModel.checkCurrentFormState
              ? () {
                  viewModel.registerUser();
                  // Navigator.pushNamed(
                  //   context,
                  //   RouteManager.checkEmailPage,
                  //   arguments: AppStrings.verifyRegistration,
                  // );
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              AppStrings.createNewAccount,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}
