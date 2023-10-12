import 'package:find_me/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.onChanged});

  final Function(bool value) onChanged;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isRememberMe,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor:
          MaterialStateColor.resolveWith((states) => AppColors.lightGrey2),
      side: BorderSide(
        color: AppColors.lightGrey3,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: 2, vertical: -4),
      onChanged: (value) {
        setState(() {
          isRememberMe = !isRememberMe;
        });
        widget.onChanged(isRememberMe);
      },
    );
  }
}
