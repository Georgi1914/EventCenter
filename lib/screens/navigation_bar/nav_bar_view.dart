import 'package:flutter/material.dart';

import 'components/bottom_navigation.dart';
import 'components/nav_bar_body.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        bottomNavigationBar: BottomNavigationView(),
        body: NavBarBody(),
      );
}
