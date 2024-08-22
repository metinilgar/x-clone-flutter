import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/controller/navigation_controller.dart';

class NavigationbarContent extends ConsumerWidget {
  const NavigationbarContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationControllerProvider);

    List<Widget> destinations = const [
      // Home
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Home',
      ),

      // Search
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

      // Notifications
      NavigationDestination(
        icon: Icon(Icons.notifications_outlined),
        selectedIcon: Icon(Icons.notifications),
        label: 'Notifications',
      ),
    ];

    return Container(
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
          destinations: destinations),
    );
  }
}
