import 'package:flutter/material.dart';

import 'components/home_nav_bar.dart';
import 'components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        bottomNavigationBar: HomeNavBar(),
        body: HomeScreenBody(),
      );
}
