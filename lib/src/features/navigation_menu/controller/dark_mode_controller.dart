import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/utils/providers/shared_preferences_provider.dart';

part 'dark_mode_controller.g.dart';

@riverpod
class DarkModeController extends _$DarkModeController {
  @override
  ThemeMode? build() {
    final preferences = ref.read(sharedPreferencesProvider);
    final themeMode = preferences.getString('themeMode');

    if (themeMode == 'light') {
      return ThemeMode.light;
    } else if (themeMode == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  void setThemeMode(ThemeMode? themeMode) {
    state = themeMode;

    final preferences = ref.read(sharedPreferencesProvider);
    preferences.setString('themeMode', themeMode.toString().split('.').last);
  }
}
