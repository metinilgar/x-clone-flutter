import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/data/fake_user_data.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_app_bar/profile_app_bar.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_app_bar/profile_information.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Posts', 'Likes'];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            // ProfileAppBar
            const ProfileAppBar(),
            const ProfileInformation(),

            // TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  tabs: tabs
                      .map((String name) => Tab(
                            text: name,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],

          // TabBarView
          body: TabBarView(
            children: tabs.map((String name) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 16.0),
                key: PageStorageKey<String>(name),
                itemCount: appUser.tweets.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TweetCard(data: appUser.tweets[index]),
                      const Divider(),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      )),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
