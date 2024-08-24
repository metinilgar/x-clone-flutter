import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';

class DrawerProfileHeader extends StatelessWidget {
  const DrawerProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/default_avatar.png'),
          ),
          const SizedBox(height: 10),

          // Name
          Text(
            appUser.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),

          // Username
          Text(
            '@${appUser.userName}',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
