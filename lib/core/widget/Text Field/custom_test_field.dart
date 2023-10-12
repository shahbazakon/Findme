import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/text_style.dart';

class CustomTestField extends StatefulWidget {
  const CustomTestField(
      {super.key,
      required this.controller,
      this.label,
      this.isObscureButton = false});

  final TextEditingController controller;
  final String? label;
  final bool isObscureButton;

  @override
  State<CustomTestField> createState() => _CustomTestFieldState();
}

class _CustomTestFieldState extends State<CustomTestField> {
  bool isObscure = false;
  @override
  void initState() {
    isObscure = widget.isObscureButton;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextHelper.h10,
      obscureText: isObscure,
      decoration: InputDecoration(
          label: Visibility(
              visible: widget.label != null, child: Text("${widget.label}")),
          labelStyle: TextHelper.h10.copyWith(color: AppColors.lightGrey3),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGrey3, width: 2),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGrey2, width: 2),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: AppColors.lightGrey1,
          suffix: Visibility(
            visible: widget.isObscureButton,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Text(
                isObscure ? "Show" : "Hide",
                style: TextHelper.h9.copyWith(color: AppColors.primary),
              ),
            ),
          )),
    );
  }
}
