import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() => ThemeData(
      primaryColor: const Color.fromARGB(255, 88, 76, 244),
      backgroundColor: const Color.fromARGB(255, 31, 34, 42),
      cardColor: const Color.fromARGB(100, 31, 34, 42),
      fontFamily: FontFamily.urbanist,
      textTheme: const TextTheme(
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
        bodyText2: TextStyle(
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s14,
          color: AppColors.red,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s32,
          color: AppColors.red,
        ),
        headline1: TextStyle(
          fontSize: FontSize.s32,
          fontWeight: FontWeightManager.bold,
          color: AppColors.white,
        ),
        headline2: TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.bold,
          color: AppColors.white,
        ),
        headline3: TextStyle(
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.bold,
          color: AppColors.white,
        ),
        headline4: TextStyle(
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.regular,
          color: AppColors.white,
        ),
        headline5: TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.regular,
          color: AppColors.white,
        ),
        headline6: TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.semiBold,
          color: AppColors.grayTextColor,
        ),
      ),
      chipTheme: const ChipThemeData(
        secondarySelectedColor: Colors.white,
        side: BorderSide(
          color: AppColors.primaryPurple,
          width: 2.0,
        ),
      ),
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.white,
        dialBackgroundColor: Colors.blue,
        dialTextColor: Colors.white,
        hourMinuteTextColor: Colors.black,
        entryModeIconColor: Colors.blue,
        helpTextStyle: TextStyle(color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
