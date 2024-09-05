import 'package:flutter/material.dart';
import 'package:x_clone_flutter/src/common_widgets/vector_icon.dart';
import 'package:x_clone_flutter/src/utils/constants/svg_asset.dart';

class TweetAction extends StatelessWidget {
  const TweetAction({
    super.key,
    required this.asset,
    required this.text,
    this.onTap,
  });
  final SvgAsset asset;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          VectorIcon(asset: asset, height: 20),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: Color(0xFF566370)),
          ),
        ],
      ),
    );
  }
}
