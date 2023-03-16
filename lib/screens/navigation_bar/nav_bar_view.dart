import 'package:flutter/material.dart';

import 'components/bottom_navigation.dart';
import 'components/nav_bar_body.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({required this.isUser, super.key});

  final bool isUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: const BottomNavigationView(),
        body: NavBarBody(
          isUser: isUser,
        ),
      );
}
