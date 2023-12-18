import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/custom_clipper_widget.dart';
import 'package:flutter/material.dart';

class ClipperShape extends StatelessWidget {
  const ClipperShape({super.key, required this.size, required this.child});
  final double size;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomClipperWidget(
      filePath: "assets/json/squareClipShape.json",
      size: Size(size, size),
      bgColor: Colors.transparent,
      child: Container(
        height: size,
        width: size,
        color: Colors.white,
        child: InteractiveViewer(child: child),
      ),
    );
  }
}
