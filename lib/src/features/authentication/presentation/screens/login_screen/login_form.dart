import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/login_controller.dart';
import 'package:x_clone_flutter/src/features/authentication/presentation/controllers/validation_controller.dart';
import 'package:x_clone_flutter/src/features/navigation_menu/presentation/navigation_menu.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    String email = "";
    String password = "";
    final state = ref.watch(loginControllerProvider);

    ref.listen<AsyncValue<bool>>(
      loginControllerProvider,
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
          // Email
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.arrow_forward_ios_outlined),
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

          // Login button
          ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () async {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();
                      final loginStatus = await ref
                          .read(loginControllerProvider.notifier)
                          .loginUser(email, password);

                      if (loginStatus && context.mounted) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const NavigationMenu(),
                          ),
                        );
                      }
                    }
                  },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Text("Login"),
          ),
        ],
      ),
    );
  }
}
