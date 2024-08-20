import 'package:flutter/material.dart';

class XDividerTheme {
  XDividerTheme._();

  static DividerThemeData kLightDividerTheme = const DividerThemeData().copyWith(
    color: Colors.grey[300],
    thickness: 1,
  );

  static DividerThemeData kDarkDividerTheme = const DividerThemeData().copyWith(
    color: Colors.grey[700],
    thickness: 1,
  );
}
