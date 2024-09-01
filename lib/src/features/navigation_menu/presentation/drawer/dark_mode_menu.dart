import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/controller/dark_mode_controller.dart';

class DarkModeMenu extends ConsumerWidget {
  const DarkModeMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setThemeMode =
        ref.read(darkModeControllerProvider.notifier).setThemeMode;
    final themeModeGroupValue = ref.watch(darkModeControllerProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          width: 40.0,
          height: 3.0,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Dark Mode',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(),
        RadioListTile(
          title: const Text('Off'),
          controlAffinity: ListTileControlAffinity.trailing,
          value: ThemeMode.light,
          groupValue: themeModeGroupValue,
          onChanged: setThemeMode,
        ),
        RadioListTile(
          title: const Text('On'),
          controlAffinity: ListTileControlAffinity.trailing,
          value: ThemeMode.dark,
          groupValue: themeModeGroupValue,
          onChanged: setThemeMode,
        ),
        RadioListTile(
          title: const Text('Use Device Settings'),
          controlAffinity: ListTileControlAffinity.trailing,
          value: ThemeMode.system,
          groupValue: themeModeGroupValue,
          onChanged: setThemeMode,
        ),
      ],
    );
  }
}
