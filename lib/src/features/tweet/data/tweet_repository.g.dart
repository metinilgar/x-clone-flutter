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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
