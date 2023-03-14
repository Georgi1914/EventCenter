import 'package:flutter/material.dart';

import '../../presentation/color_manager.dart';
import 'components/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: LoginBody(),
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: false,
      );
}
