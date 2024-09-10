import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/banner_image.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/controller/user_profile_information_controller.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:x_clone_flutter/src/utils/providers/user_id_provider.dart';

class ProfileAppBar extends ConsumerStatefulWidget {
  const ProfileAppBar(this.userId, {super.key});

  final String userId;

  @override
  ConsumerState<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends ConsumerState<ProfileAppBar> {
  bool followStatus = false;

  @override
  Widget build(BuildContext context) {
    final userStatus = ref.read(userIdProvider)! == widget.userId;

    ref.listen<AsyncValue>(
        userProfileInformationControllerProvider(widget.userId),
        (previous, next) {
      if (next.isRefreshing == false && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
          ),
        );
      }
    });

    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 190,
      pinned: true,

      // Back Button
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
      ),

      // More Options Button
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],

      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        bool isAppBarExpanded = constraints.maxHeight > kToolbarHeight;

        return FlexibleSpaceBar(
          title: isAppBarExpanded
              ? null
              : Text(
                  ref
                      .watch(UserProfileInformationControllerProvider(
                          widget.userId))
                      .when(
                          data: (data) => data.fullname,
                          error: (error, _) => "",
                          loading: () => ""),
                ),
          background: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Banner Image
              const BannerImage(),

              // Profile Image
              Positioned(
                left: 8,
                top: 100,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 4.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      appUser.photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Edit Profile Button
              Positioned(
                right: 8,
                bottom: 0,
                child: OutlinedButton(
                  onPressed: userStatus
                      ? () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditProfileScreen(widget.userId),
                            ),
                          )
                      : () {
                          ref
                              .read(userProfileInformationControllerProvider(
                                      widget.userId)
                                  .notifier)
                              .followUser(widget.userId, followStatus);
                          followStatus = !followStatus;
                        },
                  child: userStatus
                      ? const Text('Edit Profile')
                      : followStatus
                          ? const Text('Unfollow')
                          : const Text('Follow'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
