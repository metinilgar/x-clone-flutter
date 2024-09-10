// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_post_list_controlller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profilePostListControlllerHash() =>
    r'f28e6ec4fd950805a1643e613ab99e9a5b9af41f';

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

abstract class _$ProfilePostListControlller
    extends BuildlessAutoDisposeAsyncNotifier<List<TweetData>> {
  late final String userId;

  FutureOr<List<TweetData>> build(
    String userId,
  );
}

/// See also [ProfilePostListControlller].
@ProviderFor(ProfilePostListControlller)
const profilePostListControlllerProvider = ProfilePostListControlllerFamily();

/// See also [ProfilePostListControlller].
class ProfilePostListControlllerFamily
    extends Family<AsyncValue<List<TweetData>>> {
  /// See also [ProfilePostListControlller].
  const ProfilePostListControlllerFamily();

  /// See also [ProfilePostListControlller].
  ProfilePostListControlllerProvider call(
    String userId,
  ) {
    return ProfilePostListControlllerProvider(
      userId,
    );
  }

  @override
  ProfilePostListControlllerProvider getProviderOverride(
    covariant ProfilePostListControlllerProvider provider,
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
  String? get name => r'profilePostListControlllerProvider';
}

/// See also [ProfilePostListControlller].
class ProfilePostListControlllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProfilePostListControlller,
        List<TweetData>> {
  /// See also [ProfilePostListControlller].
  ProfilePostListControlllerProvider(
    String userId,
  ) : this._internal(
          () => ProfilePostListControlller()..userId = userId,
          from: profilePostListControlllerProvider,
          name: r'profilePostListControlllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profilePostListControlllerHash,
          dependencies: ProfilePostListControlllerFamily._dependencies,
          allTransitiveDependencies:
              ProfilePostListControlllerFamily._allTransitiveDependencies,
          userId: userId,
        );

  ProfilePostListControlllerProvider._internal(
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
  FutureOr<List<TweetData>> runNotifierBuild(
    covariant ProfilePostListControlller notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(ProfilePostListControlller Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfilePostListControlllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProfilePostListControlller,
      List<TweetData>> createElement() {
    return _ProfilePostListControlllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfilePostListControlllerProvider &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfilePostListControlllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<TweetData>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _ProfilePostListControlllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProfilePostListControlller,
        List<TweetData>> with ProfilePostListControlllerRef {
  _ProfilePostListControlllerProviderElement(super.provider);

  @override
  String get userId => (origin as ProfilePostListControlllerProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
