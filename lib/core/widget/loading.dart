import 'package:find_me/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading(
      {super.key,
      this.strokeWidth,
      this.isSmall = true,
      this.size,
      this.isColorsWhite = false});

  final bool isColorsWhite;
  final double? strokeWidth;
  final double? size;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    double loaderSize = isSmall ? (size == null ? 20 : size!) : 40;
    double loaderStrokeWidth =
        isSmall ? (strokeWidth == null ? 6 : strokeWidth!) : 4.5;
    return Center(
      child: SizedBox(
        width: loaderSize,
        height: loaderSize,
        child: FittedBox(
          child: CircularProgressIndicator(
            strokeWidth: loaderStrokeWidth,
            color: isColorsWhite ? AppColors.light : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
