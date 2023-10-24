import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GradientWidget extends StatelessWidget {
  GradientWidget({
    super.key,
    this.child,
  });

  final QrImageView? child;
  Gradient gradient = LinearGradient(colors: [
    Colors.purple.shade800,
    Colors.cyan.shade500,
  ]);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
