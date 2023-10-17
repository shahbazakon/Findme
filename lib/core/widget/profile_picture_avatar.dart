import 'dart:io';

import 'package:find_me/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_color.dart';
import 'dialogBox/pick_images_dialogbox.dart';

class ProfilePictureAvatar extends StatefulWidget {
  const ProfilePictureAvatar(
      {super.key, this.showEditButton = false, required this.radius});
  final bool showEditButton;
  final double radius;
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
                  width: widget.radius * .10, color: AppColors.light),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: widget.radius * .20,
                    color: AppColors.lightGrey3)
              ]),
          child: CircleAvatar(
            radius: widget.radius,
            backgroundImage: pickedImage != null
                ? Image.file(
                    File(pickedImage!.path),
                    fit: BoxFit.cover,
                  ).image
                : const NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3569&q=80"),
          ),
        ),
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
