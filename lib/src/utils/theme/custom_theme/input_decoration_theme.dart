import 'package:flutter/material.dart';

class XInputDecorationTheme {
  XInputDecorationTheme._();

  // Light input decoration theme
  static const InputDecorationTheme kLightInputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );

  // Dark input decoration theme
  static const InputDecorationTheme kDarkInputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );
}
