import 'package:find_me/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/text_style.dart';
import '../../utils/utils_methods.dart';

class AppDialogBox {
  final ImagePicker _picker = ImagePicker();

  Future getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Navigator.pop(navigatorKey.currentContext!, image);
    return image;
  }

  Future getImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    Navigator.pop(navigatorKey.currentContext!, image);
    return image;
  }

  @override
  Future<XFile?> pickImages() {
    AppLocalizations? translate =
        AppLocalizations.of(navigatorKey.currentContext!);
    return showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) {
        return FittedBox(
          child: Container(
              width: width,
              height: height * .5,
              margin: EdgeInsets.symmetric(horizontal: width * .1),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightGrey1,
                  border: Border.all(color: AppColors.lightGrey2, width: 2)),
              child: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CloseButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        pickerSourceButton(
                            label: translate!.pickFormGallery,
                            icon: Icons.image_outlined,
                            onClick: () {
                              getImageFromGallery();
                            }),
                        pickerSourceButton(
                            label: translate.pickFormCamera,
                            icon: Icons.camera_alt_outlined,
                            onClick: () {
                              getImageFromCamera();
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
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
    );
  }
}
