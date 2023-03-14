import 'package:flutter/material.dart';

import '../../../presentation/string_manager.dart';
import '../../custom_widgets/custom_header.dart';
import 'login_button.dart';
import 'login_form.dart';
import 'register_or_guest_column.dart';
import 'wrapped_in_dividers_text.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
        child: Column(
          children: const [
            CustomHeader(text: AppStrings.loginAcc),
            LoginForm(),
            LoginButton(),
            Spacer(),
            WrappedInDividersText(
              text: AppStrings.accountNotCreated,
            ),
            RegisterOrGuestColumn(),
          ],
        ),
      );
}
