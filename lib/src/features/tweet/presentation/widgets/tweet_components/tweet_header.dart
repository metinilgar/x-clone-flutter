import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/common_widgets/vector_icon.dart';
import 'package:x_clone_flutter/src/utils/constants/svg_asset.dart';

class TweetHeader extends StatelessWidget {
  const TweetHeader(
      {super.key,
      required this.displayName,
      required this.username,
      required this.date});
  final String displayName;
  final String username;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Display name
        Text(
          displayName,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 4.0),

        // Verified icon
        const VectorIcon(asset: SvgAsset.verified, height: 18),
        const SizedBox(width: 4.0),

        // Username
        Expanded(
          child: Text(
            '@$username',
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: const TextStyle(color: Color(0xFF566370)),
          ),
        ),
        const SizedBox(width: 4.0),

        // Tweet metadata
        Expanded(
          child: Text(
            date,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: const TextStyle(color: Color(0xFF566370)),
          ),
        ),

        // More icon
        const Icon(
          Icons.more_vert,
          color: Color(0xFF566370),
          size: 20,
        ),
      ],
    );
  }
}
