import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key, this.durationInSeconds = 30, this.onEnd});

  final int durationInSeconds;
  final Function()? onEnd;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
        duration: Duration(seconds: durationInSeconds),
        tween: Tween(begin: const Duration(seconds: 30), end: Duration.zero),
        onEnd: onEnd,
        builder: (BuildContext context, Duration value, Widget? child) {
          final seconds = value.inSeconds % 60;
          return Text('$seconds',
              textAlign: TextAlign.center,
              style: TitleHelper.h5.copyWith(color: AppColors.primary));
        });
  }
}
