import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/controller/user_profile_information_controller.dart';

class ProfileInformation extends ConsumerWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(userProfileInformationControllerProvider);

    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: appUser.when(
              data: (user) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        user.fullname,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4.0),

                      // Username
                      Text(
                        '@${user.username}',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(height: 8.0),

                      // Bio
                      Text(user.description),
                      const SizedBox(height: 8.0),

                      // Followers and Following
                      Row(
                        children: [
                          Text(
                            '${user.followingCount} Following',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 16.0),
                          Text(
                            '${user.followersCount} Followers',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
              error: (error, _) => Text(error.toString()),
              loading: () => const Center(child: CircularProgressIndicator()))),
    );
  }
}
