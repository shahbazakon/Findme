import 'dart:developer';

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/home_features/academicDetails/presentation/pages/academic_details_screen.dart';
import 'package:find_me/feature/home_features/home/data/models/home_model.dart';
import 'package:find_me/feature/home_features/home/presentation/cubit/home__cubit.dart';
import 'package:find_me/feature/settings_features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  HomeModel? data;

  @override
  void initState() {
    String? userId = sharedPreferences!.getString(LocaleStorageKey.userID);
    context.read<HomeCubit>().fetchHomeData(id: userId!);
    super.initState();
  }

  Future<HomeResult> getPortfolio({required String cardName}) async {
    try {
      for (var element in data?.result ?? []) {
        if (cardName.toLowerCase() == element.cardTitle?.toLowerCase()) {
          log("element Type: ${element.runtimeType}");
          return element;
        }
      }
      return HomeResult(); // or return ""; depending on your requirement
    } catch (error) {
      showSnackBar(title: error.toString());
      return HomeResult(); // or return ""; depending on your requirement
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          showSnackBar(title: state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return SizedBox(
              height: height,
              child: const Loading(
                isSmall: false,
              ));
        } else if (state is HomeError) {
          return Center(
            child: Text(translate!.oopsSomethingWentWrong),
          );
        } else if (state is HomeLoaded) {
          data = state.homeModel;
          return Scaffold(
            appBar: HomeAppBar(
              profileImage: data?.result?.first.picture?.first.url,
              onProfileClick: () {
                cupertinoNavigator(screenName: const SettingsScreen());
              },
            ),
            body: SingleChildScrollView(
                physics: const ScrollPhysics(
                    parent: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics())),
                child: Container(
                  padding: primaryPadding,
                  height: height,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          translate!.hiThere(
                              "${data?.result?.first.firstName ?? ""} ${data?.result?.first.lastName ?? ""}"),
                          textAlign: TextAlign.left,
                          style: SubTitleHelper.h3,
                        ),
                      ),
                      // CustomSearchBar(searchController: searchController),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // number of items in each row
                                  mainAxisSpacing: 10.0,
                                  // spacing between rows
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio:
                                      1.1 // spacing between columns
                                  ),
                          children: [
                            customGridTile(
                                title: translate!.personal,
                                image: AppImages.personal,
                                onTap: () async {
                                  HomeResult presonalData =
                                      await getPortfolio(cardName: 'Personal');
                                  cupertinoNavigator(
                                      screenName: PersonalDetailsScreen(
                                          data: presonalData));
                                }),
                            customGridTile(
                                title: translate!.business,
                                image: AppImages.business,
                                onTap: () {
                                  cupertinoNavigator(
                                      screenName:
                                          const BusinessDetailsScreen());
                                }),
                            customGridTile(
                                title: translate!.corporate,
                                image: AppImages.corporate,
                                onTap: () {
                                  cupertinoNavigator(
                                      screenName:
                                          const CorporateDetailsScreen());
                                }),
                            customGridTile(
                                title: translate!.academic,
                                image: AppImages.academic,
                                onTap: () async {
                                  HomeResult academicData =
                                      await getPortfolio(cardName: 'Academic');
                                  cupertinoNavigator(
                                      screenName: AcademicDetailsScreen(
                                          data: academicData));
                                }),
                            customGridTile(
                                title: translate!.matrimony,
                                image: AppImages.matrimony,
                                onTap: () {
                                  cupertinoNavigator(
                                      screenName:
                                          const MatrimonyDetailsScreen());
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
        } else {
          return Center(child: Text(translate!.oopsSomethingWentWrong));
        }
      },
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
                child: Image.asset(image, fit: BoxFit.cover)),
          )),
    );
  }
}
