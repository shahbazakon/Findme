import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants.dart';

class ProjectListTile extends StatelessWidget {
  const ProjectListTile(
      {super.key,
      required this.title,
      this.subTitle,
      required this.startDate,
      this.description,
      this.endDate});
  final String title;
  final String? subTitle;
  final String? description;
  final String startDate;
  final String? endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: appBoxDecoration,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextHelper.h9,
          ),
          RichText(
            text: subTitle != null
                ? TextSpan(
                    text: "Role: ",
                    style: SubTitleHelper.h11
                        .copyWith(color: AppFontsColors.lightGrey4),
                    children: [
                        TextSpan(
                          text: "$subTitle",
                          style: TextHelper.h11,
                        ),
                      ])
                : const TextSpan(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Start Date: ",
                  style: SubTitleHelper.h12
                      .copyWith(color: AppFontsColors.lightGrey4),
                  children: [
                    TextSpan(
                      text: startDate,
                      style: TextHelper.h12,
                    ),
                  ]),
              endDate != null
                  ? TextSpan(
                      text: "End Date: ",
                      style: SubTitleHelper.h12
                          .copyWith(color: AppFontsColors.lightGrey4),
                      children: [
                          TextSpan(
                            text: "$endDate",
                            style: TextHelper.h12,
                          ),
                        ])
                  : const TextSpan(),
            ])),
          ),
          Visibility(
            visible: description != null,
            child: Text("$description", style: TextHelper.h11),
          ),
        ],
      ),
    );
  }
}
