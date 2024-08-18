import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'validation_controller.g.dart';

@riverpod
class ValidationController extends _$ValidationController {
  @override
  void build() {
    return;
  }

  // Username validation method
  String? userNameValidation(String? userName) {
    if (userName == null || userName.isEmpty || userName.length < 3) {
      return "Please enter a valid username.";
    }
    return null;
  }

  // Name validation method
  String? nameValidation(String? name) {
    if (name == null || name.isEmpty || name.length < 3) {
      return "Please enter a valid name.";
    }
    return null;
  }

  // Email validation method
  String? emailValidation(String? email) {
    if (email == null ||
        email.isEmpty ||
        !email.contains("@") ||
        !email.contains(".") ||
        email.length < 5) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  // Password validation method
  String? passwordValidation(String? password) {
    if (password == null ||
        password.isEmpty ||
        password.length < 8 ||
        password.contains(RegExp(r'[A-Z]')) == false ||
        password.contains(RegExp(r'[a-z]')) == false ||
        password.contains(RegExp(r'[0-9]')) == false ||
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) == false) {
      return "Please enter a valid password";
    }
    return null;
  }
}
