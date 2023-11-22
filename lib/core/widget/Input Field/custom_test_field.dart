import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../utils/text_style.dart';

class CustomTestField extends StatefulWidget {
  const CustomTestField(
      {super.key,
      required this.controller,
      this.label,
      this.padding,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.validator,
      this.readOnly = false,
      this.isObscureButton = false});

  final TextEditingController controller;
  final String? label;
  final bool isObscureButton;
  final EdgeInsets? padding;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;

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
    return Container(
      padding: widget.padding ?? EdgeInsets.symmetric(vertical: height * .01),
      child: TextFormField(
        controller: widget.controller,
        style: SubTitleHelper.h10,
        obscureText: isObscure,
        readOnly: widget.readOnly,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        validator: widget.validator,
        decoration: InputDecoration(
            label: Visibility(
                visible: widget.label != null, child: Text("${widget.label}")),
            labelStyle:
                SubTitleHelper.h10.copyWith(color: AppColors.lightGrey3),
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
      ),
    );
  }
}
