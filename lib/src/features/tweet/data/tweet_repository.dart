import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/api/dio_exception_message.dart';
import 'package:x_clone_flutter/src/api/dio_provider.dart';
import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';

part 'tweet_repository.g.dart';

class TweetRepository {
  final Dio dio;

  TweetRepository(this.dio);

  Future<List<TweetData>> getTweets() async {
    try {
      final response = await dio.get("/tweets");

      if (response.statusCode == 200) {
        return (response.data as List)
            .reversed
            .map((e) => TweetData.fromMap(e))
            .toList();
      }

      throw "something went wrong";
    } on DioException catch (e) {
      throw DioExceptionMessage.fromDioError(e).errorMessage;
    }
  }
}

@riverpod
TweetRepository tweetRepository(TweetRepositoryRef ref) {
  return TweetRepository(ref.read(dioProvider));
}

@riverpod
Future<List<TweetData>> getTweets(GetTweetsRef ref) {
  return ref.read(tweetRepositoryProvider).getTweets();
}
