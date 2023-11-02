import 'package:flutter/cupertino.dart';

import '../../constants/app_color.dart';

class AppSwitchButton extends StatefulWidget {
  AppSwitchButton({super.key, required this.value, this.onChanged});

  bool value;
  Function(bool)? onChanged;
  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      trackColor: AppColors.red,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
