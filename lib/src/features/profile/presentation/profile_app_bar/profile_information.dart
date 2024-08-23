import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metin Ilgar Mutlu',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '@metinilgarmutlu',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 8.0),
            const Text(
                "Flutter Developer. I'm a software engineer who loves to write code and build apps."),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                Text(
                  '46 Takip edilen',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16.0),
                Text(
                  '11 Takipçi',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
