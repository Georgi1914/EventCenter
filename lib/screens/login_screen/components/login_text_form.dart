import 'package:flutter/material.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';

class LoginTextForm extends StatelessWidget {
  final TextEditingController? textController;
  final String hintText;
  final IconData icon;
  const LoginTextForm({
    required this.textController,
    required this.hintText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPasswordField = hintText == AppStrings.password;
    final bool isEmailField = hintText == AppStrings.email;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                hintText,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                AppStrings.requiredSign,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextField(
            textCapitalization: isEmailField
                ? TextCapitalization.none
                : TextCapitalization.words,
            controller: textController,
            obscureText:
                isPasswordField || hintText == AppStrings.confirmPassword,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryPurple,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: AppColors.cardColor,
              filled: true,
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.headline6,
              hintMaxLines: 2,
              errorMaxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
