import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/controller/user_profile_information_controller.dart';

class DrawerProfileHeader extends ConsumerWidget {
  const DrawerProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(userProfileInformationControllerProvider);

    return DrawerHeader(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: appUser.when(
          data: (user) => Column(
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
                    user.fullname,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),

                  // Username
                  Text(
                    '@${user.username}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
          error: (error, stackTrace) =>
              const Text('Error loading user profile'),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
