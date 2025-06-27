import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.blue,
    secondaryHeaderColor: AppColors.teal,
    scaffoldBackgroundColor: AppColors.white,
    cardColor: AppColors.gray,
    canvasColor: AppColors.grayLight,
    appBarTheme: AppBarTheme(
      color: AppColors.navy,
      elevation: 0,
      toolbarTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize + 8,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize + 8,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.white),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize + 2,
        fontWeight: FontWeight.normal,
        color: AppColors.gray60,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize,
        fontWeight: FontWeight.normal,
        color: AppColors.gray60,
      ),
      titleLarge: TextStyle(
        fontFamily: 'ZenMaruGothic',
        fontSize: baseFontSize + 10,
        fontWeight: FontWeight.w600,
        color: AppColors.navy,
      ),
      titleMedium: TextStyle(
        fontFamily: 'ZenMaruGothic',
        fontSize: baseFontSize + 2,
        fontWeight: FontWeight.w600,
        color: AppColors.navy,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: AppColors.blue),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.blue,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: AppColors.navy,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      color: AppColors.black,
      elevation: 0,
      toolbarTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize + 8,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize + 8,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize + 4,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: baseFontSize + 2,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ),
      titleLarge: TextStyle(
        fontFamily: 'ZenMaruGothic',
        fontSize: baseFontSize + 10,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.navy,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: AppColors.white),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.navy,
    ),
  );
}
