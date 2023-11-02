import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomProfileInfoTile extends StatelessWidget {
  const CustomProfileInfoTile(
      {super.key,
      required this.title,
      this.leadingImage,
      this.showDivider = true});
  final String title;
  final String? leadingImage;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leadingImage == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        leadingImage!,
                        height: 25,
                        width: 25,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
              Expanded(
                child: Text(title,
                    style: SubTitleHelper.h11
                        .copyWith(fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ),
        Visibility(
          visible: showDivider,
          child: Divider(
            height: 3,
            color: AppFontsColors.lightGrey4,
          ),
        ),
      ],
    );
  }
}
