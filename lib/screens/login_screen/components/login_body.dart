import 'package:flutter/material.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/string_manager.dart';
import 'login_button.dart';
import 'login_form.dart';
import 'no_account_text.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          children: [
            const LoginForm(),
            const LoginButton(),
            const Spacer(),
            const NoAccountText(),
            FloatingActionButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RouteManager.registerScreen),
              child: const Text(AppStrings.signUp),
            ),
          ],
        ),
      );
}
