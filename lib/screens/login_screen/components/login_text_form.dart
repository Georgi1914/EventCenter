import 'package:flutter/material.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/font_manager.dart';
import '../../../presentation/string_manager.dart';

class LoginTextForm extends StatelessWidget {
  final TextEditingController? textController;
  final String hintText;
  const LoginTextForm({
    required this.textController,
    required this.hintText,
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
              Text(
                hintText,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Text(
                AppStrings.requiredSign,
                style: TextStyle(
                  fontFamily: FontFamily.urbanist,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s14,
                  color: AppColors.red,
                ),
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
            style: Theme.of(context).textTheme.headline4,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              hintText: hintText,
              hintMaxLines: 2,
              errorMaxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
