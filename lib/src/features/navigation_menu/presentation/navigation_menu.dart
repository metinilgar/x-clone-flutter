import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/controller/navigation_controller.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/appbar/appbar_content.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/screens/create_post.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/drawer/drawer_contents.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/navigationbar/navigationbar_content.dart';
import 'package:x_clone_flutter/src/features/notifications/notifications_screen.dart';
import 'package:x_clone_flutter/src/features/search/search_screen.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/screens/tweet_list_screen.dart';
import 'package:hidable/hidable.dart';

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu> {
  final ScrollController scrollController = ScrollController();

  void _openCreatePost() {
    showModalBottomSheet<void>(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: double.infinity,
      ),
      shape: const RoundedRectangleBorder(),
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return const CreatePost();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navigationControllerProvider);

    return Scaffold(
      floatingActionButton: selectedIndex == 0
          ? Hidable(
              controller: scrollController,
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  onPressed: () => _openCreatePost(),
                  child: const Icon(Icons.add),
                ),
              ),
            )
          : null,

      // AppBasr
      appBar: Hidable(
        preferredWidgetSize: const Size.fromHeight(100),
        controller: scrollController,
        child: const AppbarContent(),
      ),

      // Drawer
      drawer: const DrawerContents(),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        child: NavigationbarContent(scrollController: scrollController),
      ),

      // Body
      body: IndexedStack(
        index: selectedIndex,
        children: [
          TweetListScreen(scrollController: scrollController),
          const SearchScreen(),
          const NotificationsScreen(),
        ],
      ),
    );
  }
}
