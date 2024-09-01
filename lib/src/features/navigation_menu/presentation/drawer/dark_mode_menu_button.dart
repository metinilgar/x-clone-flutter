import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/controller/dark_mode_controller.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/drawer/dark_mode_menu.dart';

class DarkModeMenuButton extends StatelessWidget {
  const DarkModeMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(26),
      onPressed: () {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const DarkModeMenu();
          },
        );
      },
      icon: Consumer(
        builder: (context, ref, child) {
          final themeMode = ref.watch(darkModeControllerProvider);

          final brightness = MediaQuery.of(context).platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;

          if (themeMode == ThemeMode.light) {
            return const Icon(Icons.light_mode_outlined);
          } else if (themeMode == ThemeMode.dark) {
            return const Icon(Icons.dark_mode_outlined);
          } else {
            return Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            );
          }
        },
      ),
    );
  }
}
