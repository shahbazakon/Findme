import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/utils_methods.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView(
      {super.key,
      required this.image,
      required this.title,
      required this.subText,
      this.subTitle});
  final String title;
  final String subText;
  final String? subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(title, style: TitleHelper.h1),
          SvgPicture.asset(
            image,
            height: height * .4,
          ),
          subTitle == null
              ? const SizedBox.shrink()
              : Text(
                  subTitle!,
                  style: TitleHelper.h10,
                  textAlign: TextAlign.center,
                ),
          Text(
            subText,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
