import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_flutter/src/features/tweet/data/tweet_repository.dart';
import 'package:x_clone_flutter/src/features/tweet/presentation/widgets/tweet_card.dart';

class TweetListScreen extends ConsumerWidget {
  const TweetListScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweets = ref.watch(getTweetsProvider);

    return Scaffold(
      body: tweets.when(
        data: (data) {
          return ListView.builder(
            controller: scrollController,
            itemCount: data.length,
            itemBuilder: (context, index) => Column(
              children: [
                TweetCard(data: data[index]),
                const Divider(),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}
