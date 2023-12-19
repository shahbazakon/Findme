import 'dart:ui';

import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';

class BlurBackground extends StatefulWidget {
  const BlurBackground({super.key, this.bgImage});
  final String? bgImage;

  @override
  State<BlurBackground> createState() => _BlurBackgroundState();
}

class _BlurBackgroundState extends State<BlurBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
            tag: "BackgroundImageTag",
            child: widget.bgImage == null
                ? placeHolderImage
                : Image.network(
                    widget.bgImage!,
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return placeHolderImage;
                    },
                  )),
        widget.bgImage == null
            ? const SizedBox.shrink()
            : BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  alignment: Alignment.center,
                ),
              ),
      ],
    );
  }
}
