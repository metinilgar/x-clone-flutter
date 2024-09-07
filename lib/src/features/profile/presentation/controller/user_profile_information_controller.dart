import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/profile/data/profile_repository.dart';
import 'package:x_clone_flutter/src/features/profile/models/user_profile.dart';
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
}
