import 'package:flutter/material.dart';

class ClickableOverlay extends StatelessWidget {
  const ClickableOverlay({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        // Overlay
        Positioned.fill(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              color: Colors.black38,

              // Camera Icon
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
