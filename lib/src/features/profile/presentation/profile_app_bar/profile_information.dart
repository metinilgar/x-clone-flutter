import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Text(
              appUser.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4.0),

            // Username
            Text(
              '@${appUser.userName}',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 8.0),

            // Bio
            Text(appUser.bio),
            const SizedBox(height: 8.0),

            // Followers and Following
            Row(
              children: [
                Text(
                  '${appUser.following} Following',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 16.0),
                Text(
                  '${appUser.followers} Followers',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
