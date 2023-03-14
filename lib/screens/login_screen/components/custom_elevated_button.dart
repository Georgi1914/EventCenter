import 'package:flutter/material.dart';

import '../../../presentation/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    required this.text,
    required this.navigation,
    super.key,
  });

  final String text;
  final VoidCallback navigation;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: navigation,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.primaryPurple,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 8,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
      );
}
