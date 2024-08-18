import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/utils/theme/theme.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/auth_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      // Light theme
      theme: XAppTheme.kLightTheme,

      // Dark theme
      darkTheme: XAppTheme.kDarkTheme,
      home: const AuthScreen(),
    );
  }
}
