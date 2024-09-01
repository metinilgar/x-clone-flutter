import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/controller/dark_mode_controller.dart';
import 'package:x_clone_flutter/src/utils/providers/shared_preferences_provider.dart';
import 'package:x_clone_flutter/src/utils/theme/theme.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(darkModeControllerProvider),

      // Light theme
      theme: XAppTheme.kLightTheme,

      // Dark theme
      darkTheme: XAppTheme.kDarkTheme,
      home: const SplashScreen(),
    );
  }
}
