import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:x_clone_flutter/src/utils/providers/shared_preferences_provider.dart";

part 'user_id_provider.g.dart';

@riverpod
String? userId(UserIdRef ref) {
  final preferences = ref.read(sharedPreferencesProvider);
  final userId = preferences.getString('userId');
  return userId;
}
