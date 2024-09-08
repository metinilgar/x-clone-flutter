import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/profile/data/profile_repository.dart';
import 'package:x_clone_flutter/src/features/profile/models/user_profile.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/controller/profile_post_list_controlller.dart';
import 'package:x_clone_flutter/src/utils/providers/user_id_provider.dart';

part 'user_profile_information_controller.g.dart';

@riverpod
class UserProfileInformationController
    extends _$UserProfileInformationController {
  @override
  FutureOr<UserProfile> build() {
    return ref
        .read(profileRepositoryProvider)
        .getUserProfile(ref.read(userIdProvider)!);
  }

  Future<void> updateProfile(String fullname, String description) async {
    await ref
        .read(profileRepositoryProvider)
        .updateProfile(ref.read(userIdProvider)!, fullname, description);

    refresh();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    ref.invalidate(profilePostListControlllerProvider);
    await future;
  }
}
