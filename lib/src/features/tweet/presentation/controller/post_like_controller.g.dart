// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postLikeControllerHash() =>
    r'4492c825121f7b79d8c1f8bd0d628bb58cc76f99';

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

abstract class _$PostLikeController
    extends BuildlessAutoDisposeAsyncNotifier<int> {
  late final String tweetId;

  FutureOr<int> build(
    String tweetId,
  );
}

/// See also [PostLikeController].
@ProviderFor(PostLikeController)
const postLikeControllerProvider = PostLikeControllerFamily();

/// See also [PostLikeController].
class PostLikeControllerFamily extends Family<AsyncValue<int>> {
  /// See also [PostLikeController].
  const PostLikeControllerFamily();

  /// See also [PostLikeController].
  PostLikeControllerProvider call(
    String tweetId,
  ) {
    return PostLikeControllerProvider(
      tweetId,
    );
  }

  @override
  PostLikeControllerProvider getProviderOverride(
    covariant PostLikeControllerProvider provider,
  ) {
    return call(
      provider.tweetId,
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
  String? get name => r'postLikeControllerProvider';
}

/// See also [PostLikeController].
class PostLikeControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PostLikeController, int> {
  /// See also [PostLikeController].
  PostLikeControllerProvider(
    String tweetId,
  ) : this._internal(
          () => PostLikeController()..tweetId = tweetId,
          from: postLikeControllerProvider,
          name: r'postLikeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postLikeControllerHash,
          dependencies: PostLikeControllerFamily._dependencies,
          allTransitiveDependencies:
              PostLikeControllerFamily._allTransitiveDependencies,
          tweetId: tweetId,
        );

  PostLikeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tweetId,
  }) : super.internal();

  final String tweetId;

  @override
  FutureOr<int> runNotifierBuild(
    covariant PostLikeController notifier,
  ) {
    return notifier.build(
      tweetId,
    );
  }

  @override
  Override overrideWith(PostLikeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostLikeControllerProvider._internal(
        () => create()..tweetId = tweetId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tweetId: tweetId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PostLikeController, int>
      createElement() {
    return _PostLikeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostLikeControllerProvider && other.tweetId == tweetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tweetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostLikeControllerRef on AutoDisposeAsyncNotifierProviderRef<int> {
  /// The parameter `tweetId` of this provider.
  String get tweetId;
}

class _PostLikeControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PostLikeController, int>
    with PostLikeControllerRef {
  _PostLikeControllerProviderElement(super.provider);

  @override
  String get tweetId => (origin as PostLikeControllerProvider).tweetId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
