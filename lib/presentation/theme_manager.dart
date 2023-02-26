import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() => ThemeData(
      primaryColor: const Color.fromARGB(255, 88, 76, 244),
      backgroundColor: const Color.fromARGB(255, 31, 34, 42),
      cardColor: const Color.fromARGB(100, 31, 34, 42),
      fontFamily: FontFamily.urbanist,
      textTheme: const TextTheme(
          headline2: TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.bold,
            color: AppColors.white,
          ),
          subtitle1: TextStyle(
            fontSize: FontSize.s12,
            fontWeight: FontWeightManager.regular,
            color: AppColors.primaryPurple,
          ),
          subtitle2: TextStyle(
            fontSize: FontSize.s12,
            fontWeight: FontWeightManager.regular,
            color: AppColors.white,
          ),
          headline6: TextStyle(color: Colors.red)),
      chipTheme: const ChipThemeData(
        secondarySelectedColor: Colors.white,
        side: BorderSide(
          color: AppColors.primaryPurple,
          width: 2.0,
        ),
      ),
      canvasColor: Colors.transparent,
    );
