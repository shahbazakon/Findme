import 'package:find_me/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.onChanged, this.initValue});

  final Function(bool value) onChanged;
  final bool? initValue;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isRememberMe;
  @override
  void initState() {
    isRememberMe = widget.initValue ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isRememberMe,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: MaterialStateColor.resolveWith(
          (states) => isRememberMe! ? AppColors.primary : AppColors.lightGrey2),
      side: BorderSide(
        color: AppColors.lightGrey3,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
      onChanged: (value) {
        setState(() {
          isRememberMe = !isRememberMe!;
        });
        widget.onChanged(isRememberMe!);
      },
    );
  }
}
