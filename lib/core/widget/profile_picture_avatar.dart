import 'dart:io';

import 'package:find_me/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/app_color.dart';
import 'dialogBox/pick_images_dialogbox.dart';

class ProfilePictureAvatar extends StatefulWidget {
  const ProfilePictureAvatar(
      {super.key,
      required this.radius,
      this.showEditButton = false,
      this.isShadowDown = false,
      this.isBorderVisible = true});
  final bool showEditButton;
  final double radius;
  final bool isBorderVisible;
  final bool isShadowDown;
  @override
  State<ProfilePictureAvatar> createState() => _ProfilePictureAvatarState();
}

class _ProfilePictureAvatarState extends State<ProfilePictureAvatar> {
  AppDialogBox dialogBox = AppDialogBox();
  XFile? pickedImage;
  @override
  Widget build(BuildContext context) {
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
                  : const FadeInImage(
                      placeholder: AssetImage('assets/placeholder_image.png'),
                      image: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3569&q=80"),
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
