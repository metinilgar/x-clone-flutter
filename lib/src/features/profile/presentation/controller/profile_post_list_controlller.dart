import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/profile/data/profile_repository.dart';
import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';

part 'profile_post_list_controlller.g.dart';

@riverpod
class ProfilePostListControlller extends _$ProfilePostListControlller {
  @override
  FutureOr<List<TweetData>> build(String userId) {
    return ref.read(profileRepositoryProvider).getTweetList(userId);
  }
}
