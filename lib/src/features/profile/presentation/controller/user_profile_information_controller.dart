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

  Future<void> followUser(String userId, bool followStatus) async {
    String path = followStatus ? "unfollow" : "follow";
    try {
      await ref
          .read(profileRepositoryProvider)
          .followUser(userId, ref.read(userIdProvider)!, path);
      refresh();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
