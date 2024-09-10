// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_information_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileInformationControllerHash() =>
    r'6039c25e334a1cb18f254e83e42d14b47e69674a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UserProfileInformationController
    extends BuildlessAutoDisposeAsyncNotifier<UserProfile> {
  late final String userId;

  FutureOr<UserProfile> build(
    String userId,
  );
}

/// See also [UserProfileInformationController].
@ProviderFor(UserProfileInformationController)
const userProfileInformationControllerProvider =
    UserProfileInformationControllerFamily();

/// See also [UserProfileInformationController].
class UserProfileInformationControllerFamily
    extends Family<AsyncValue<UserProfile>> {
  /// See also [UserProfileInformationController].
  const UserProfileInformationControllerFamily();

  /// See also [UserProfileInformationController].
  UserProfileInformationControllerProvider call(
    String userId,
  ) {
    return UserProfileInformationControllerProvider(
      userId,
    );
  }

  @override
  UserProfileInformationControllerProvider getProviderOverride(
    covariant UserProfileInformationControllerProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProfileInformationControllerProvider';
}

/// See also [UserProfileInformationController].
class UserProfileInformationControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        UserProfileInformationController, UserProfile> {
  /// See also [UserProfileInformationController].
  UserProfileInformationControllerProvider(
    String userId,
  ) : this._internal(
          () => UserProfileInformationController()..userId = userId,
          from: userProfileInformationControllerProvider,
          name: r'userProfileInformationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userProfileInformationControllerHash,
          dependencies: UserProfileInformationControllerFamily._dependencies,
          allTransitiveDependencies:
              UserProfileInformationControllerFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserProfileInformationControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<UserProfile> runNotifierBuild(
    covariant UserProfileInformationController notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserProfileInformationController Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserProfileInformationControllerProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserProfileInformationController,
      UserProfile> createElement() {
    return _UserProfileInformationControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileInformationControllerProvider &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserProfileInformationControllerRef
    on AutoDisposeAsyncNotifierProviderRef<UserProfile> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserProfileInformationControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        UserProfileInformationController,
        UserProfile> with UserProfileInformationControllerRef {
  _UserProfileInformationControllerProviderElement(super.provider);

  @override
  String get userId =>
      (origin as UserProfileInformationControllerProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
