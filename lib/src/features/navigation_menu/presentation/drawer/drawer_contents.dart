import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/drawer/drawer_profile_header.dart';

class DrawerContents extends StatelessWidget {
  const DrawerContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        children: [
          // Drawer Header
          const DrawerProfileHeader(),

          // Drawer Profile
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () => Navigator.pop(context),
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
    );
  }
}
