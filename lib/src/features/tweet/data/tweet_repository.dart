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

  Future<void> createPost(String userId, String content) async {
    try {
      final response = await dio.post(
        "/tweets",
        data: {"user_id": userId, "content": content},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
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
