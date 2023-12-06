import 'package:find_me/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading(
      {super.key,
      this.strokeWidth,
      this.size = 20,
      this.isColorsWhite = false});

  final bool isColorsWhite;
  final double? strokeWidth;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: FittedBox(
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth ?? 6,
            color: isColorsWhite ? AppColors.light : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
