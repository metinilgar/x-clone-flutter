// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tweetRepositoryHash() => r'441ec4cde83a55cb26a9b89aadb1ae2756dfa378';

/// See also [tweetRepository].
@ProviderFor(tweetRepository)
final tweetRepositoryProvider = AutoDisposeProvider<TweetRepository>.internal(
  tweetRepository,
  name: r'tweetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tweetRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TweetRepositoryRef = AutoDisposeProviderRef<TweetRepository>;
String _$getTweetsHash() => r'683930505a63149bca8dab12fb27b6527996a875';

/// See also [getTweets].
@ProviderFor(getTweets)
final getTweetsProvider = AutoDisposeFutureProvider<List<TweetData>>.internal(
  getTweets,
  name: r'getTweetsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTweetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTweetsRef = AutoDisposeFutureProviderRef<List<TweetData>>;
String _$createPostHash() => r'f06c2b1a7cb393592b11f43a4a8ba99d2a290947';

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

/// See also [createPost].
@ProviderFor(createPost)
const createPostProvider = CreatePostFamily();

/// See also [createPost].
class CreatePostFamily extends Family<AsyncValue<TweetData>> {
  /// See also [createPost].
  const CreatePostFamily();

  /// See also [createPost].
  CreatePostProvider call({
    required String userId,
    required String content,
  }) {
    return CreatePostProvider(
      userId: userId,
      content: content,
    );
  }

  @override
  CreatePostProvider getProviderOverride(
    covariant CreatePostProvider provider,
  ) {
    return call(
      userId: provider.userId,
      content: provider.content,
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
  String? get name => r'createPostProvider';
}

/// See also [createPost].
class CreatePostProvider extends AutoDisposeFutureProvider<TweetData> {
  /// See also [createPost].
  CreatePostProvider({
    required String userId,
    required String content,
  }) : this._internal(
          (ref) => createPost(
            ref as CreatePostRef,
            userId: userId,
            content: content,
          ),
          from: createPostProvider,
          name: r'createPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createPostHash,
          dependencies: CreatePostFamily._dependencies,
          allTransitiveDependencies:
              CreatePostFamily._allTransitiveDependencies,
          userId: userId,
          content: content,
        );

  CreatePostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.content,
  }) : super.internal();

  final String userId;
  final String content;

  @override
  Override overrideWith(
    FutureOr<TweetData> Function(CreatePostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatePostProvider._internal(
        (ref) => create(ref as CreatePostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        content: content,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TweetData> createElement() {
    return _CreatePostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatePostProvider &&
        other.userId == userId &&
        other.content == content;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, content.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreatePostRef on AutoDisposeFutureProviderRef<TweetData> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `content` of this provider.
  String get content;
}

class _CreatePostProviderElement
    extends AutoDisposeFutureProviderElement<TweetData> with CreatePostRef {
  _CreatePostProviderElement(super.provider);

  @override
  String get userId => (origin as CreatePostProvider).userId;
  @override
  String get content => (origin as CreatePostProvider).content;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
