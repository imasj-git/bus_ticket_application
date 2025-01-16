import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Lora Regular',
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Lora Regular',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lora Bold'),
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        fontFamily: 'Lora Regular',
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Lora Regular',
      ),
    ),
  );
}
