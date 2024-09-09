import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
        baseUrl: 'http://10.0.2.2:3000/api/v1',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        responseType: ResponseType.json),
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'jwt');

      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options); // request devam etsin
    },
  ));

  return dio;
}
