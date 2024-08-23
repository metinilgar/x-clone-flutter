import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_app_bar/profile_app_bar.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_app_bar/profile_information.dart';

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
            const ProfileAppBar(),
            const ProfileInformation(),
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
          body: TabBarView(
            children: tabs.map((String name) {
              return ListView.builder(
                key: PageStorageKey<String>(name),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    color: index.isEven ? Colors.grey[500] : Colors.grey[600],
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        'Post $index',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
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
