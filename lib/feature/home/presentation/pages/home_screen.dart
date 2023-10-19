import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/common_ui.dart';
import '../../../../core/widget/Input Field/custom_searchbar.dart';
import '../../../personalDetails/presentation/pages/personal_details_screen.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: primaryPadding,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hi There!\n Aliya",
                textAlign: TextAlign.left,
                style: SubTitleHelper.h3,
              ),
            ),
            CustomSearchBar(searchController: searchController),
            Expanded(
              // height: height * .5,
              child: GridView.builder(
                itemCount: 20,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 10.0, // spacing between rows
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.1 // spacing between columns
                    ),
                itemBuilder: (context, index) {
                  return customGridTile(
                      title: "Personal",
                      image:
                          "https://c4.wallpaperflare.com/wallpaper/356/292/33/music-rock-and-roll-vinyl-album-covers-wallpaper-preview.jpg",
                      onTap: () {
                        cupertinoNavigator(
                            screenName: const PersonalDetailsScreen());
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Grid Tile
  Widget customGridTile(
      {required String title,
      required String image,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: GridTile(
          footer: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title,
                textAlign: TextAlign.center,
                style: SubTitleHelper.h8.copyWith(color: AppFontsColors.light)),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image))),
          )),
    );
  }
}
