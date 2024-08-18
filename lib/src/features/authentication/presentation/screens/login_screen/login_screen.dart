import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/login_screen/login_form.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                const SizedBox(width: 150, height: 150, child: Placeholder()),
                const SizedBox(height: 20),

                // Welcome message
                Text(
                  "Welcome back!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),

                // Submessage
                Text(
                  "I wonder what is happening in the world right now.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),

                // Login form
                const LoginForm(),
                const SizedBox(height: 40),

                // Create a new account message
                const Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text("Do you already have an account?"),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 40),

                // Create a new account button
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("Create a new account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
