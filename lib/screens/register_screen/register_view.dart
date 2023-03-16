import 'package:flutter/material.dart';

import '../../presentation/color_manager.dart';
import 'components/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: const RegisterBody(),
        appBar: AppBar(),
      );
}
