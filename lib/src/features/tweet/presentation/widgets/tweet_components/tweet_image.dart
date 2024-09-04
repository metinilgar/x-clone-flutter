import 'package:flutter/material.dart';

class TweetImage extends StatelessWidget {
  const TweetImage({super.key, required this.imageName});
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Image.asset(imageName),
    );
  }
}