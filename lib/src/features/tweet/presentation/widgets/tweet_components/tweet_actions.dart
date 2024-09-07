import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/controller/post_like_controller.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_components/tweet_action.dart';
import 'package:x_clone_flutter/src/utils/constants/svg_asset.dart';

class TweetActions extends ConsumerStatefulWidget {
  const TweetActions({super.key, required this.id});

  final String id;

  @override
  ConsumerState<TweetActions> createState() => _TweetActionsState();
}

class _TweetActionsState extends ConsumerState<TweetActions> {
  bool likeStatus = true;

  @override
  Widget build(BuildContext context) {
    final like = ref.watch(postLikeControllerProvider(widget.id));

    ref.listen<AsyncValue<int>>(postLikeControllerProvider(widget.id),
        (previous, next) {
      if (next.isRefreshing == false && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
          ),
        );
      }
    });

    return Row(
      children: [
        TweetAction(
          icon: likeStatus
              ? const Icon(Icons.favorite_border,
                  size: 22, color: Color(0xFF566370))
              : const Icon(Icons.favorite, size: 22, color: Color(0xFFE5387F)),
          text: like.when(
            data: (data) => data.toString(),
            loading: () => '...',
            error: (error, _) => '...',
          ),
          onTap: () {
            ref
                .read(postLikeControllerProvider(widget.id).notifier)
                .likePost(widget.id, likeStatus);
            likeStatus = !likeStatus;
          },
        ),
        const SizedBox(width: 24.0),
        const TweetAction(asset: SvgAsset.comment, text: 'Reply'),
        const SizedBox(width: 24.0),
        const TweetAction(asset: SvgAsset.link, text: 'Copy link'),
      ],
    );
  }
}
