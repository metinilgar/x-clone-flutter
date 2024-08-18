import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/validation_controller.dart';

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          // First Name and Last Name
          Row(
            children: [
              // First Name
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    prefixIconColor: Theme.of(context).colorScheme.primary,
                    labelText: "First Name",
                  ),
                  validator: ref
                      .read(validationControllerProvider.notifier)
                      .nameValidation,
                ),
              ),
              const SizedBox(width: 20),

              // Last Name
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    prefixIconColor: Theme.of(context).colorScheme.primary,
                    labelText: "Last Name",
                  ),
                  validator: ref
                      .read(validationControllerProvider.notifier)
                      .passwordValidation,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // User Name
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: Theme.of(context).colorScheme.primary,
              labelText: "User Name",
            ),
            validator: ref
                .read(validationControllerProvider.notifier)
                .userNameValidation,
          ),
          const SizedBox(height: 20),

          // E-mail
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
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

          // Confirm Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password),
              prefixIconColor: Theme.of(context).colorScheme.primary,
              suffixIcon: const Icon(Icons.visibility_off),
              labelText: "Confirm Password",
            ),
            validator: ref
                .read(validationControllerProvider.notifier)
                .passwordValidation,
          ),
          const SizedBox(height: 20),

          // Create Account button
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Create account logic
                ref.read(authControllerProvider.notifier).createAccount();
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text("Create Account"),
          ),
        ],
      ),
    );
  }
}
