import 'package:flutter/material.dart';

import 'components/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: LoginBody(),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
      );
}
