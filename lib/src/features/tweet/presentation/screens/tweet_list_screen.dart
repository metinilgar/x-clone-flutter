import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/controller/post_list_controller.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_card.dart';

class TweetListScreen extends ConsumerWidget {
  const TweetListScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweets = ref.watch(postListControllerProvider);

    return Scaffold(
      body: tweets.when(
        data: (data) {
          return data.isNotEmpty
              ? ListView.builder(
                  controller: scrollController,
                  itemCount: data.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      TweetCard(data: data[index]),
                      const Divider(),
                    ],
                  ),
                )
              : const Center(child: Text('No tweets yet'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}
