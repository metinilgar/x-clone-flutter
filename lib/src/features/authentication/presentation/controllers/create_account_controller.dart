import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/authentication/data/auth_repository.dart';

part 'create_account_controller.g.dart';

@riverpod
class CreateAccountController extends _$CreateAccountController {
  @override
  FutureOr<void> build() async {}

  Future<bool> createAccount(
      String username, String fullname, String password, String email) async {
    try {
      return await ref
          .read(authRepositoryProvider)
          .createAccount(username, fullname, password, email);
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
      return false;
    }
  }
}
