import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/banner_image.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/edit_profile_screen.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: isAppBarExpanded ? null : Text(appUser.name),
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
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
