import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/controller/profile_post_list_controlller.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_app_bar/profile_app_bar.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_app_bar/profile_information.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_card.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen(this.userId, {super.key});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> tabs = <String>['Posts', 'Likes'];
    final posts = ref.watch(profilePostListControlllerProvider(userId));

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            // ProfileAppBar
            ProfileAppBar(userId),
            ProfileInformation(userId),

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
          body: TabBarView(children: [
            posts.when(data: (data) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 12),
                itemCount: data.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    TweetCard(data: data[index]),
                    const Divider(),
                  ],
                ),
              );
            }, error: (error, _) {
              return Center(
                child: Text(error.toString()),
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
            const Center(
              child: Text('Likes'),
            ),
          ]),
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
