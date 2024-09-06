import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_controller.g.dart';

@riverpod
class NavigationController extends _$NavigationController {
  @override
  int build() {
    return 0;
  }

  void onDestinationSelected(int value, ScrollController scrollController) {
    if (value == state) {
      scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      state = value;
    }
  }
}
