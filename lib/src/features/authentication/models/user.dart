import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class User {
  final String id;
  final String name;
  final String userName;
  final String email;
  final String photoUrl;
  final String bannerUrl;
  final String followers;
  final String following;
  final String bio;
  final List<TweetData> tweets;

  User({
    required this.name,
    required this.userName,
    required this.email,
    required this.photoUrl,
    required this.bannerUrl,
    required this.followers,
    required this.following,
    required this.tweets,
    this.bio = '',
  }) : id = uuid.v4();
}
