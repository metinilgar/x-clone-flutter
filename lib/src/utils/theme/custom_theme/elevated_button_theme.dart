import 'package:flutter/material.dart';

class XElevatedButtonTheme {
  XElevatedButtonTheme._();

  static ElevatedButtonThemeData kLightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  static ElevatedButtonThemeData kDarkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );
}
