import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/string_manager.dart';
import '../register_view_model.dart';
import 'register_button.dart';
import 'register_text_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<RegisterViewModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                RegisterTextForm(
                  textController: viewModel.controllers['firstName'],
                  hintText: AppStrings.firstName,
                ),
                RegisterTextForm(
                  textController: viewModel.controllers['lastName'],
                  hintText: AppStrings.lastName,
                ),
                RegisterTextForm(
                  textController: viewModel.controllers['email'],
                  hintText: AppStrings.email,
                ),
                RegisterTextForm(
                  hintText: AppStrings.password,
                  textController: viewModel.controllers['password'],
                ),
                RegisterTextForm(
                  hintText: AppStrings.confirmPassword,
                  textController: viewModel.controllers['confirmPassword'],
                ),
                const RegisterButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
