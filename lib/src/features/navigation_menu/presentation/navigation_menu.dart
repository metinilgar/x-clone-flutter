import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/controller/navigation_controller.dart';
import 'package:x_clone_flutter/src/features/notifications/notifications_screen.dart';
import 'package:x_clone_flutter/src/features/search/search_screen.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/tweet_list_screen.dart';

class NavigationMenu extends ConsumerWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationControllerProvider);

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: const SizedBox(width: 25, height: 25, child: Placeholder())),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerTheme.color!),
          ),
        ),
        child: NavigationBar(
          indicatorColor: Colors.transparent,
          height: 50,
          selectedIndex: selectedIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onDestinationSelected: ref
              .read(navigationControllerProvider.notifier)
              .onDestinationSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.search,
              ),
              selectedIcon: Icon(
                Icons.search,
                shadows: <Shadow>[Shadow(blurRadius: 2.0)],
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          TweetListScreen(),
          SearchScreen(),
          NotificationsScreen(),
        ],
      ),
    );
  }
}
