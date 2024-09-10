import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/profile/presentation/profile_screen.dart';
import 'package:x_clone_flutter/src/features/tweet/models/tweet_data.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_components/tweet_actions.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_components/tweet_header.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_components/tweet_image.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_components/tweet_text.dart';
import 'package:x_clone_flutter/src/utils/providers/user_id_provider.dart';

class TweetCard extends ConsumerWidget {
  const TweetCard({super.key, required this.data});
  final TweetData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Stack(
            children: [
              ClipOval(
                child: Image.asset('assets/default_avatar.png',
                    width: 48, height: 48),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white.withOpacity(0.4),
                    highlightColor: Colors.white.withOpacity(0.3),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onTap: () {
                      String userId;
                      if (data.userId != ref.read(userIdProvider)!) {
                        userId = data.userId;
                      } else {
                        userId = ref.read(userIdProvider)!;
                      }

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(userId),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
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
                  date: data.formattedDate,
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
                TweetActions(id: data.id),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
