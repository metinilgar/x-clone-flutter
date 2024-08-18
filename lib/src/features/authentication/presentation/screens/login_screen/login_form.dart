import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/validation_controller.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.arrow_forward_ios_outlined),
              prefixIconColor: Theme.of(context).colorScheme.primary,
              labelText: "E-mail",
            ),
            validator:
                ref.read(validationControllerProvider.notifier).emailValidation,
          ),
          const SizedBox(height: 20),

          // Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password),
              prefixIconColor: Theme.of(context).colorScheme.primary,
              suffixIcon: const Icon(Icons.visibility_off),
              labelText: "Password",
            ),
            validator: ref
                .read(validationControllerProvider.notifier)
                .passwordValidation,
          ),
          const SizedBox(height: 20),

          // Login button
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ref.read(authControllerProvider.notifier).loginUser();
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
