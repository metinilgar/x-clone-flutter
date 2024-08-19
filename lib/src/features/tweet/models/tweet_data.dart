class TweetData {
  const TweetData({
    required this.displayName,
    required this.username,
    required this.body,
    this.image,
    required this.time,
    required this.date,
    required this.likesCount,
    required this.repliesCount,
  });
  final String displayName;
  final String username;
  final String body;
  final String? image;
  final String time;
  final String date;
  final int likesCount;
  final int repliesCount;
}
