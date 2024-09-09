import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:x_clone_flutter/src/api/dio_exception_message.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  Future<void> loginUser(String id) async {}

  Future<bool> createAccount(
      String username, String fullname, String password, String email) async {
    try {
      final response = await dio.post(
        "/auth/register",
        data: {
          "username": username,
          "fullname": fullname,
          "password": password,
          "email": email
        },
      );

      if (response.statusCode == 200) {
        return true;
      }

      throw "something went wrong";
    } on DioException catch (e) {
      throw DioExceptionMessage.fromDioError(e).errorMessage;
    }
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(Dio(
    BaseOptions(
        baseUrl: 'http://10.0.2.2:3000',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        responseType: ResponseType.json),
  ));
}
