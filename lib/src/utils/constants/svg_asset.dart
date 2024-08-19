import 'package:flutter/material.dart';

/// Enum to represent SVG assets
enum SvgAsset {
  comment('assets/icon_comment.svg', Color(0xFF4999E9)),
  heartBlue('assets/icon_heart_blue.svg', Color(0xFF70ABE6)),
  heartRed('assets/icon_heart_red.svg', Color(0xFFE5387F)),
  info('assets/icon_info.svg', Color(0xFF566370)),
  link('assets/icon_link.svg', Color(0xFF566370)),
  verified('assets/icon_verified.svg', Color(0xFF4999E9)),
  x('assets/icon_x.svg', Color(0xFF101419));

  const SvgAsset(this.path, this.color);
  final String path;
  final Color color;
}
