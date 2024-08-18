import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/signup_screen/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const SizedBox(height: 100, width: 100, child: Placeholder()),
                const SizedBox(height: 60),

                // Title
                Text(
                  "What's going on right now",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),

                // Description
                Text(
                  "Join us now to stay up to date with what's going on.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),

                // Create an account button
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Create an account"),
                ),
                const SizedBox(height: 10),
                const Divider(),
              ],
            ),

            // Already have an account text and log in button
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  // Already have an account text
                  Text(
                    "Do you already have an account?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),

                  // Log in button
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: const Text("Log in"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
