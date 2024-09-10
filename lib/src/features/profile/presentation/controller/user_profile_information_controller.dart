import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/profile/data/profile_repository.dart';
import 'package:x_clone_flutter/src/features/profile/models/user_profile.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/controller/profile_post_list_controlller.dart';

part 'user_profile_information_controller.g.dart';

@riverpod
class UserProfileInformationController
    extends _$UserProfileInformationController {
  @override
  FutureOr<UserProfile> build(String userId) {
    return ref.read(profileRepositoryProvider).getUserProfile(userId);
  }

  Future<void> updateProfile(
      {required String fullname,
      required String description,
      required String userId}) async {
    await ref
        .read(profileRepositoryProvider)
        .updateProfile(userId, fullname, description);

    refresh();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    ref.invalidate(profilePostListControlllerProvider);
    await future;
  }
}
