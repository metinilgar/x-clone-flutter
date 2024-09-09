import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/auth_screen.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/navigation_menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isLogin();
  }

  void isLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    bool isLogin = preferences.getBool('isLoggedIn') ?? false;

    if (isLogin) {
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NavigationMenu()));
      });
    } else {
      Timer(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AuthScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: Placeholder(),
        ),
      ),
    );
  }
}
