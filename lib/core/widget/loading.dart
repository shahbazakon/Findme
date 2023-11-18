import 'package:find_me/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: FittedBox(
        child: CircularProgressIndicator(
          strokeWidth: 6,
          color: AppColors.light,
        ),
      ),
    );
  }
}
