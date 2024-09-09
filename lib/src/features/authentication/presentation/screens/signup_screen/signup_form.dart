import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/create_account_controller.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/validation_controller.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/screens/login_screen/login_screen.dart';

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController pass = TextEditingController();
    String email = "";
    String password = "";
    String username = "";
    String fullname = "";

    ref.listen<AsyncValue>(
      createAccountControllerProvider,
      (previous, state) {
        if (state.isRefreshing == false && state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
            ),
          );
        }
      },
    );

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
                  onSaved: (newValue) => fullname = newValue!,
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
                  onSaved: (newValue) => fullname += " $newValue",
                  validator: ref
                      .read(validationControllerProvider.notifier)
                      .nameValidation,
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
            onSaved: (newValue) => username = newValue!,
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
            onSaved: (newValue) => email = newValue!,
            validator:
                ref.read(validationControllerProvider.notifier).emailValidation,
          ),
          const SizedBox(height: 20),

          // Password
          TextFormField(
            controller: pass,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.password),
              prefixIconColor: Theme.of(context).colorScheme.primary,
              suffixIcon: const Icon(Icons.visibility_off),
              labelText: "Password",
            ),
            onSaved: (newValue) => password = newValue!,
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
            validator: (value) {
              if (value!.isEmpty) return "Please enter your password";
              if (value != pass.text) return "Password does not match";
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Create Account button
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                formKey.currentState?.save();

                final status = await ref
                    .read(createAccountControllerProvider.notifier)
                    .createAccount(
                      username,
                      fullname,
                      password,
                      email,
                    );

                if (status && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Account created successfully"),
                    ),
                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
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
