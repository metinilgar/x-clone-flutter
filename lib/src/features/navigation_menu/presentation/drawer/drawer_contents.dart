import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/drawer/dark_mode_menu.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/drawer/drawer_profile_header.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_screen.dart';

class DrawerContents extends StatelessWidget {
  const DrawerContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: ListView(
                children: [
                  // Drawer Header
                  const DrawerProfileHeader(),

                  // Drawer Profile
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.person_outline),
                    title: const Text('Profile'),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    ),
                  ),

                  // Drawer Settings
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Settings'),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),

          // Change Theme
          IconButton(
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
            icon: const Icon(Icons.brightness_4_outlined),
          ),
        ],
      ),
    );
  }
}
