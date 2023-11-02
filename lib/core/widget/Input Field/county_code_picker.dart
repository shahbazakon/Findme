import 'package:country_code_picker/country_code_picker.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../utils/text_style.dart';

class CustomCountryCodePicker extends StatelessWidget {
  const CustomCountryCodePicker(
      {super.key,
      required this.onChanged,
      this.textStyle,
      this.showOnlyCountryWhenClosed = false,
      this.showCountryOnly = false});
  final Function(CountryCode value) onChanged;
  final bool showOnlyCountryWhenClosed;
  final bool showCountryOnly;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      enabled: true,
      alignLeft: false,
      showFlag: false,
      showFlagDialog: true,
      padding: EdgeInsets.zero,
      initialSelection: "+91",
      favorite: ['+91', 'IN'],
      backgroundColor: AppColors.lightGrey3,
      textStyle: textStyle ?? TextHelper.h10,
      searchStyle: TextHelper.h10,
      showCountryOnly: showCountryOnly,
      showOnlyCountryWhenClosed: showOnlyCountryWhenClosed,
      onChanged: onChanged,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.lightGrey1,
          border: Border.all(color: AppColors.lightGrey2, width: 3)),
    );
  }
}
