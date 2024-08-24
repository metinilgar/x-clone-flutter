import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: 190,
      pinned: true,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
      ),
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
              SizedBox(
                width: double.infinity,
                height: 140,
                child: Image.asset(
                  appUser.bannerUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 8,
                top: 100,
                right: 8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
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
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Edit Profile'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
