import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/app_color.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.numPages,
    required this.pageController,
  });

  final int numPages;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    double doteSize = 9;
    return SmoothPageIndicator(
      count: numPages,
      controller: pageController,
      effect: WormEffect(
          spacing: 6,
          dotHeight: doteSize,
          dotWidth: doteSize,
          dotColor: Colors.grey.shade300,
          activeDotColor: AppColors.primary),
      onDotClicked: (index) => pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.linear),
    );
  }
}
