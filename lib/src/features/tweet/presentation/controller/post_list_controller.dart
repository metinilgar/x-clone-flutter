import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/tweet/data/tweet_repository.dart';
import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';

part 'post_list_controller.g.dart';

@riverpod
class PostListController extends _$PostListController {
  @override
  FutureOr<List<TweetData>> build() {
    return ref.read(tweetRepositoryProvider).getTweets();
  }

  Future<void> createPost(String userId, String content) async {
    await ref.read(tweetRepositoryProvider).createPost(userId, content);

    refresh();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
