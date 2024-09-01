import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode_controller.g.dart';

@riverpod
class DarkModeController extends _$DarkModeController {
  @override
  ThemeMode? build() {
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode? themeMode) {
    state = themeMode;
  }
}
