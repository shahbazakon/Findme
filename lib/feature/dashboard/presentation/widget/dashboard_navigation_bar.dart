import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatefulWidget {
  HomeNavigationBar(
      {super.key, required this.selectedIndex, required this.pageController});

  int selectedIndex;
  final PageController pageController;

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  Color itemColor({required int index}) {
    return widget.selectedIndex == index
        ? AppColors.primary
        : AppFontsColors.dark;
  }

  double itemSize = 25;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: TitleHelper.h12,
          unselectedLabelStyle: SubTitleHelper.h12,
          onTap: (index) {
            setState(() {
              widget.selectedIndex = index;
              widget.pageController.jumpToPage(index);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.store,
                  height: itemSize, color: itemColor(index: 0)),
              label: translate!.home,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.phoneBook,
                  color: itemColor(index: 1), height: itemSize),
              label: translate!.contact,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.settings,
                  color: itemColor(index: 2), height: itemSize),
              label: translate!.settings,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.user,
                  color: itemColor(index: 3), height: itemSize),
              label: translate!.profile,
            ),
          ],
        ),
      ),
    );
  }
}
