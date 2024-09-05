import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/features/tweet/data/tweet_repository.dart';

part 'post_like_controller.g.dart';

@riverpod
class PostLikeController extends _$PostLikeController {
  @override
  FutureOr<int> build(String tweetId) async {
    final tweetData = await ref.read(tweetRepositoryProvider).getTweet(tweetId);
    return tweetData.likesCount;
  }

  // TODO: Handle error
  void likePost(String tweetId, bool like) async {
    await ref.read(tweetRepositoryProvider).likePost(tweetId, like);
    final newTweets = await ref.read(tweetRepositoryProvider).getTweet(tweetId);
    state = AsyncData(newTweets.likesCount);
  }
}
