import 'dart:ui';

import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  const BlurBackground({super.key, this.bgImage});
  final String? bgImage;
  @override
  Widget build(BuildContext context) {
    Widget placeHolderImage = Image.asset(
      AppIcons
          .placeholderImage, // Replace with the path to your placeholder image
      width: width,
      height: height,
      fit: BoxFit.cover,
    );

    return Stack(
      children: [
        Hero(
            tag: "BackgroundImageTag",
            child: bgImage == null
                ? placeHolderImage
                : Image.network(
                    bgImage!,
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return placeHolderImage;
                    },
                  )),
        bgImage == null
            ? const SizedBox.shrink()
            : ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    alignment: Alignment.center,
                  ),
                ),
              ),
      ],
    );
  }
}
