import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/tweet/data/dummy_data.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/tweet_card.dart';

class TweetListScreen extends StatelessWidget {
  const TweetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: tweets.length,
          itemBuilder: (context, index) => Column(
                children: [
                  TweetCard(data: tweets[index]),
                  const Divider(),
                ],
              )),
    );
  }
}
