import 'dart:io';

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/app_color.dart';
import 'dialogBox/pick_images_dialogbox.dart';

class ProfilePictureAvatar extends StatefulWidget {
  ProfilePictureAvatar(
      {super.key,
      required this.radius,
      this.showEditButton = false,
      this.isShadowDown = false,
      this.onPictureChange,
      this.image,
      this.isBorderVisible = true});
  final bool showEditButton;
  final double radius;
  final bool isBorderVisible;
  final bool isShadowDown;
  Function(XFile value)? onPictureChange;
  final String? image;
  @override
  State<ProfilePictureAvatar> createState() => _ProfilePictureAvatarState();
}

class _ProfilePictureAvatarState extends State<ProfilePictureAvatar> {
  AppDialogBox dialogBox = AppDialogBox();
  XFile? pickedImage;
  @override
  void initState() {
    if (widget.image != null) {
      sharedPreferences?.setString(
          LocaleStorageKey.userProfileImage, widget.image!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String profileImage = sharedPreferences
            ?.getString(LocaleStorageKey.userProfileImage) ??
        "https://res.cloudinary.com/devatchannel/image/upload/v1602752402/avatar/avatar_cugq40.png";

    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    width: widget.isBorderVisible ? widget.radius * .10 : 0,
                    color: AppColors.light),
                boxShadow: [
                  BoxShadow(
                      offset: widget.isShadowDown
                          ? const Offset(1, 6)
                          : const Offset(0, 0),
                      blurRadius: widget.isShadowDown
                          ? widget.radius * .1
                          : widget.radius * .21,
                      color: AppColors.lightGrey3)
                ]),
            child: CircleAvatar(
              radius: widget.radius,
              backgroundImage: pickedImage != null
                  ? Image.file(
                      File(pickedImage!.path),
                      fit: BoxFit.cover,
                    ).image
                  : FadeInImage(
                      placeholder: AssetImage(AppIcons.placeholderImage),
                      image: NetworkImage(widget.image ?? profileImage),
                      fit: BoxFit.cover,
                    ).image,
            )),
        Visibility(
          visible: widget.showEditButton,
          child: Positioned(
            bottom: 8,
            right: 8,
            child: InkWell(
              onTap: () async {
                // Get Image Form Image Picker Dialog
                pickedImage = await dialogBox.pickImages();
                if (pickedImage != null) {
                  widget.onPictureChange!(pickedImage!);
                }

                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset(AppIcons.edit, height: 25),
              ),
            ),
          ),
        )
      ],
    );
  }
}
