import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/api/dio_exception_message.dart';
import 'package:x_clone_flutter/src/api/dio_provider.dart';
import 'package:x_clone_flutter/src/features/profile/models/user_profile.dart';
import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  final Dio dio;

  ProfileRepository(this.dio);

  Future<List<TweetData>> getTweetList(String userId) async {
    try {
      final response = await dio.get(
        "/users/$userId/tweets",
      );

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

  Future<UserProfile> getUserProfile(String userId) async {
    try {
      final response = await dio.get(
        "/users/$userId",
      );

      if (response.statusCode == 200) {
        return UserProfile.fromMap(response.data);
      }

      throw "something went wrong";
    } on DioException catch (e) {
      throw DioExceptionMessage.fromDioError(e).errorMessage;
    }
  }

  Future<void> updateProfile(
      String userId, String fullname, String description) async {
    try {
      final response = await dio.put(
        "/users",
        data: {
          "id": userId,
          "fullname": fullname,
          "description": description,
        },
      );

      if (response.statusCode == 200) {
        return;
      }

      throw "something went wrong";
    } on DioException catch (e) {
      throw DioExceptionMessage.fromDioError(e).errorMessage;
    }
  }

  Future<void> followUser(String userId, String followerId, String path) async {
    try {
      final response = await dio.put(
        "/users/$userId/$path/$followerId",
      );

      if (response.statusCode == 200) {
        return;
      }

      throw "something went wrong";
    } on DioException catch (e) {
      throw DioExceptionMessage.fromDioError(e).errorMessage;
    }
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepository(ref.read(dioProvider));
}
