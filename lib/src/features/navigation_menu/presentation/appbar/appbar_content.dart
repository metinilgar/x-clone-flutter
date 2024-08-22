import 'package:flutter/material.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title: const SizedBox(
        width: 25,
        height: 25,

        // Logo
        child: Placeholder(),
      ),
    );
  }
}
