import 'package:flutter/material.dart';

import '../../../presentation/color_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hint,
    super.key,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return TextField(
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.headline4,
        filled: true,
        fillColor: AppColors.cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      ),
    );
  }
}
