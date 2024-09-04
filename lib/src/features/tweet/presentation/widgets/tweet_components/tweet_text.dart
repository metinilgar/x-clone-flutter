import 'package:flutter/material.dart';

class TweetText extends StatelessWidget {
  const TweetText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: const TextStyle(
        fontSize: 18,
        height: 1.25,
      ),
    );
  }
}
