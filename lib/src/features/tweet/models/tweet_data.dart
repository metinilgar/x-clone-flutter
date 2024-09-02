// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TweetData {
  const TweetData({
    required this.id,
    required this.userId,
    required this.displayName,
    required this.username,
    required this.body,
    this.image,
    required this.date,
    required this.likesCount,
  });

  final String id;
  final String userId;
  final String displayName;
  final String username;
  final String body;
  final String? image;
  final String date;
  final int likesCount;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'fullname': displayName,
      'username': username,
      'content': body,
      'image': image,
      'created_time': date,
      'liked_count': likesCount,
    };
  }

  factory TweetData.fromMap(Map<String, dynamic> map) {
    return TweetData(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      displayName: map['fullname'] as String,
      username: map['username'] as String,
      body: map['content'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      date: map['created_time'] as String,
      likesCount: map['liked_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TweetData.fromJson(String source) =>
      TweetData.fromMap(json.decode(source) as Map<String, dynamic>);
}
