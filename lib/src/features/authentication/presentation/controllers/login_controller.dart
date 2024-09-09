import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/authentication/data/auth_repository.dart';
import 'package:x_clone_flutter/src/utils/providers/shared_preferences_provider.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<bool> build() {
    final preferences = ref.read(sharedPreferencesProvider);
    return preferences.getBool('isLoggedIn') ?? false;
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      final preferences = ref.read(sharedPreferencesProvider);
      const storage = FlutterSecureStorage();

      final data =
          await ref.read(authRepositoryProvider).login(email, password);
      await preferences.setString("userId", data["id"]);
      await storage.write(key: 'jwt', value: data["token"]);
      await preferences.setBool("isLoggedIn", true);

      ref.invalidateSelf();
      return true;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  void logoutUser() {
    final preferences = ref.read(sharedPreferencesProvider);
    const storage = FlutterSecureStorage();

    preferences.remove("userId");
    storage.delete(key: 'jwt');
    preferences.setBool("isLoggedIn", false);
  }
}
