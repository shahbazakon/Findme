import 'package:find_me/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../constants/common_ui.dart';
import '../../utils/text_style.dart';
import '../../utils/utils_methods.dart';

class AppDialogBox {
  @override
  Future<void> pickImages() {
    return showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return FittedBox(
          child: Container(
              width: width,
              height: height * .5,
              margin: EdgeInsets.symmetric(horizontal: width * .1),
              padding: const EdgeInsets.all(10),
              decoration: appBoxDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  pickerSourceButton(
                      label: "Pick form Gallery",
                      icon: Icons.image_outlined,
                      onClick: () {}),
                  pickerSourceButton(
                      label: "Pick form Camera",
                      icon: Icons.camera_alt_outlined,
                      onClick: () {}),
                ],
              )),
        );
      },
    );
  }

//Picker Button
  pickerSourceButton({
    required IconData icon,
    required String label,
    required Function() onClick,
  }) {
    return Material(
      child: InkWell(
        onTap: onClick,
        child: Expanded(
          child: FittedBox(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.lightGrey2,
                  border: Border.all(color: AppColors.lightGrey2, width: 4)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: AppColors.primary, size: 100),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextHelper.h11,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
