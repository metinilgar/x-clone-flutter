import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/tweet_components/tweet_action.dart';
import 'package:x_clone_flutter/src/utils/constants/svg_asset.dart';

class TweetActions extends StatelessWidget {
  const TweetActions({super.key, required this.likesCount});
  final int likesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TweetAction(asset: SvgAsset.heartRed, text: likesCount.toString()),
        const SizedBox(width: 24.0),
        const TweetAction(asset: SvgAsset.comment, text: 'Reply'),
        const SizedBox(width: 24.0),
        const TweetAction(asset: SvgAsset.link, text: 'Copy link'),
      ],
    );
  }
}
