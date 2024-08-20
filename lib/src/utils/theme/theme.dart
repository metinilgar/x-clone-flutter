import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/utils/theme/custom_theme/divider_theme.dart';
import 'package:x_clone_flutter/src/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:x_clone_flutter/src/utils/theme/custom_theme/input_decoration_theme.dart';

class XAppTheme {
  XAppTheme._();

  // Light theme
  static ThemeData kLightTheme = ThemeData.light(useMaterial3: true).copyWith(
    // Color scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),

    // Elevated button theme
    elevatedButtonTheme: XElevatedButtonTheme.kLightElevatedButtonTheme,

    // Input decoration theme
    inputDecorationTheme: XInputDecorationTheme.kLightInputDecorationTheme,

    // Divider theme
    dividerTheme: XDividerTheme.kLightDividerTheme,
  );

  // Dark theme
  static ThemeData kDarkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    // Color scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),

    // Elevated button theme
    elevatedButtonTheme: XElevatedButtonTheme.kDarkElevatedButtonTheme,

    // Input decoration theme
    inputDecorationTheme: XInputDecorationTheme.kDarkInputDecorationTheme,

    // Divider theme
    dividerTheme: XDividerTheme.kDarkDividerTheme,
  );
}
