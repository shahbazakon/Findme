import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:flutter/material.dart';

import '../../utils/utils_methods.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.buttonWidth,
      this.isLoading = false,
      this.padding});
  final String label;
  final bool isLoading;
  final double? buttonWidth;
  final Function() onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: height * .01),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
            color: isLoading ? AppColors.lightGrey3 : AppColors.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
          width: buttonWidth ?? width,
          child: isLoading
              ? const Loading()
              : Text(
                  label,
                  style: TitleHelper.h9.copyWith(color: AppFontsColors.light),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
