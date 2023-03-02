import 'package:flutter/material.dart';

import 'login_button.dart';
import 'login_form.dart';
import 'no_account_text.dart';
import 'register_or_guest_row.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          children: const [
            LoginForm(),
            LoginButton(),
            Spacer(),
            NoAccountText(),
            RegisterOrGuestRow(),
          ],
        ),
      );
}
