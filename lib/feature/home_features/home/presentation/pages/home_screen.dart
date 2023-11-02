import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_searchbar.dart';
import 'package:find_me/feature/home_features/academicDetails/presentation/pages/academic_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../businessDetails/presentation/pages/business_details_Screen.dart';
import '../../../corporateDetails/presentation/pages/corporate_details.dart';
import '../../../matrimonyDetails/presentation/pages/matrimony_details_screen.dart';
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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(
            parent:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
        child: Container(
          padding: primaryPadding,
          height: height,
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
                child: GridView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 10.0, // spacing between rows
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.1 // spacing between columns
                      ),
                  children: [
                    customGridTile(
                        title: "Personal",
                        image:
                            "https://c4.wallpaperflare.com/wallpaper/356/292/33/music-rock-and-roll-vinyl-album-covers-wallpaper-preview.jpg",
                        onTap: () {
                          cupertinoNavigator(
                              screenName: const PersonalDetailsScreen());
                        }),
                    customGridTile(
                        title: "Business",
                        image:
                            "https://images.pexels.com/photos/936137/pexels-photo-936137.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        onTap: () {
                          cupertinoNavigator(
                              screenName: const BusinessDetailsScreen());
                        }),
                    customGridTile(
                        title: "Corporate",
                        image:
                            "https://img1.wallspic.com/previews/7/6/5/4/2/124567/124567-formal_wear-costume-gentleman-management-tasogare-x750.jpg",
                        onTap: () {
                          cupertinoNavigator(
                              screenName: const CorporateDetailsScreen());
                        }),
                    customGridTile(
                        title: "Academic",
                        image:
                            "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?auto=format&fit=crop&q=80&w=3628&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        onTap: () {
                          cupertinoNavigator(
                              screenName: const AcademicDetailsScreen());
                        }),
                    customGridTile(
                        title: "Matrimony",
                        image:
                            "https://parade.com/.image/t_share/MTkwNTgxMjEzNTc5MTI1ODg1/wedding-wishes-2-jpg.jpg",
                        onTap: () {
                          cupertinoNavigator(
                              screenName: const MatrimonyDetailsScreen());
                        }),
                  ],
                ),
              )
            ],
          ),
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
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage(AppIcons.placeholderImage),
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}
