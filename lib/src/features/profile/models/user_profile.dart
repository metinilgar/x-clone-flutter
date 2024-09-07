// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProfile {
  final String id;
  final String username;
  final String fullname;
  final String description;
  final int followersCount;
  final int followingCount;

  UserProfile({
    required this.id,
    required this.username,
    required this.fullname,
    required this.description,
    required this.followersCount,
    required this.followingCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'fullname': fullname,
      'description': description,
      'followersCount': followersCount,
      'followingCount': followingCount,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] as String,
      username: map['username'] as String,
      fullname: map['fullname'] as String,
      description:
          map['description'] != null ? map['description'] as String : "",
      followersCount: map['followersCount'] as int,
      followingCount: map['followingCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);
}
