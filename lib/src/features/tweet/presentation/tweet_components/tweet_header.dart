import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/common_widgets/vector_icon.dart';
import 'package:x_clone_flutter/src/utils/constants/svg_asset.dart';

class TweetHeader extends StatelessWidget {
  const TweetHeader(
      {super.key,
      required this.displayName,
      required this.username,
      required this.time,
      required this.date});
  final String displayName;
  final String username;
  final String time;
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
        Flexible(
          child: Text(
            username,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: const TextStyle(color: Color(0xFF566370)),
          ),
        ),
        const SizedBox(width: 4.0),

        // Tweet metadata
        // TODO: Calculate time difference and show '1m', '2h', '1d' etc. with DateTime.now()
        Text(
          time,
          style: const TextStyle(color: Color(0xFF566370)),
        ),

        // More icon
        const Spacer(),
        const Icon(
          Icons.more_vert,
          color: Color(0xFF566370),
          size: 20,
        ),
      ],
    );
  }
}
