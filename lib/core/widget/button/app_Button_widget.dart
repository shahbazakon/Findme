import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../utils/utils_methods.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.buttonWidth,
  });
  final String label;
  final double? buttonWidth;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        width: buttonWidth ?? width * .88,
        child: Text(
          label,
          style: TitleHelper.h8.copyWith(color: AppFontsColors.light),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
