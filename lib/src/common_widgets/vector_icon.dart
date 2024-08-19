import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:x_clone_flutter/src/utils/constants/svg_asset.dart';

/// Helper widget to render a SVG picture from a given asset
class VectorIcon extends StatelessWidget {
  const VectorIcon({super.key, required this.asset, this.width, this.height});
  final SvgAsset asset;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader(asset.path),
      colorFilter: ColorFilter.mode(asset.color, BlendMode.srcIn),
      width: width,
      height: height,
    );
  }
}
