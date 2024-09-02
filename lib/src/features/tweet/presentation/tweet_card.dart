import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/tweet_components/tweet_actions.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/tweet_components/tweet_header.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/tweet_components/tweet_image.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/tweet_components/tweet_text.dart';

class TweetCard extends StatelessWidget {
  const TweetCard({super.key, required this.data});
  final TweetData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          ClipOval(
            child:
                Image.asset('assets/default_avatar.png', width: 48, height: 48),
          ),
          const SizedBox(width: 8),

          // Tweet content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Tweet header
                TweetHeader(
                  displayName: data.displayName,
                  username: data.username,
                  date: data.date,
                ),
                const SizedBox(height: 12.0),

                // Tweet body
                TweetText(text: data.body),

                // Tweet image
                if (data.image != null) ...[
                  TweetImage(imageName: data.image!),
                  const SizedBox(height: 8.0),
                ],

                // Tweet actions
                TweetActions(likesCount: data.likesCount),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
