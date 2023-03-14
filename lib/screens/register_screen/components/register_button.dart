import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../register_view_model.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegisterViewModel>();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: double.maxFinite,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: AppColors.primaryPurple,
            disabledBackgroundColor: AppColors.neutralsGray,
          ),
          onPressed: viewModel.checkCurrentFormState
              ? () async {
                  await viewModel.registerUser();
                  Navigator.pop(context);
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              AppStrings.signUp,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      ),
    );
  }
}
