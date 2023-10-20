import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomTestField2 extends StatelessWidget {
  const CustomTestField2(
      {super.key,
      this.label,
      this.hintText,
      required this.controller,
      this.onTap,
      this.readOnly = false,
      this.showDropdownIcon = false});

  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final bool readOnly;
  final Function()? onTap;
  final bool showDropdownIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: label != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Text(
                "$label",
                style: SubTitleHelper.h11
                    .copyWith(color: AppFontsColors.lightGrey4),
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            style: TextHelper.h10,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                hintText: hintText,
                hintStyle:
                    TextHelper.h10.copyWith(color: AppFontsColors.lightGrey3),
                filled: true,
                fillColor: AppColors.lightGrey1,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey1),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey3),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Visibility(
                  visible: showDropdownIcon,
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
