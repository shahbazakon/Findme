import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class AddMoreButton extends StatelessWidget {
  const AddMoreButton({
    super.key,
    required this.onTap,
    this.margin,
  });

  final Function() onTap;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: DottedBorder(
            strokeCap: StrokeCap.butt,
            borderType: BorderType.RRect,
            color: AppFontsColors.lightGrey4,
            strokeWidth: .5,
            radius: const Radius.circular(10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Center(
                    child: Icon(Icons.add_rounded,
                        color: AppColors.lightGrey3, size: 25)))),
      ),
    );
  }
}
