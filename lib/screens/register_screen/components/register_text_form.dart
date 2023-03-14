import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../register_view_model.dart';

class RegisterTextForm extends StatelessWidget {
  final TextEditingController? textController;
  final String hintText;
  const RegisterTextForm({
    required this.textController,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RegisterViewModel>();
    final bool isPasswordField = hintText == AppStrings.password;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextField(
            textCapitalization: hintText == AppStrings.email
                ? TextCapitalization.none
                : TextCapitalization.words,
            controller: textController,
            obscureText:
                isPasswordField || hintText == AppStrings.confirmPassword,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryPurple,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: AppColors.cardColor,
              filled: true,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.headline6,
              hintMaxLines: 2,
              errorMaxLines: 2,
              errorText: isPasswordField && !viewModel.checkPasswordRequirements
                  ? AppStrings.passwordRequirements
                  : null,
            ),
            onChanged: (value) {
              viewModel.validateTextForms();
              if (isPasswordField) {
                viewModel.validatePassword();
              }
            },
            //onSaved: (value) => _name = value,
          ),
        ),
      ],
    );
  }
}
