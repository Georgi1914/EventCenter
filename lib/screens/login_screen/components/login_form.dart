import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/string_manager.dart';
import '../login_view_model.dart';
import 'login_text_form.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginTextForm(
            textController: viewModel.emailController,
            hintText: AppStrings.email,
            icon: Icons.email_outlined,
          ),
          LoginTextForm(
            textController: viewModel.passwordController,
            hintText: AppStrings.password,
            icon: Icons.lock_outline,
          ),
        ],
      ),
    );
  }
}
