import 'dart:async';

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/Profile/presentation/cubit/profile_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/navigators.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    apiCall();
    super.initState();
  }

  void apiCall() {
    String? userID = sharedPreferences?.getString(LocaleStorageKey.userID);
    if (userID != null) {
      context.read<ProfileDetailsCubit>().fetchProfileDetails(userID: userID);
    }
  }

  @override
  Widget build(BuildContext buildContext) {
    double height = MediaQuery.of(buildContext).size.height;
    return Scaffold(
      body: BlocListener<ProfileDetailsCubit, ProfileDetailsState>(
        listener: (context, state) {
          if (state is ProfileDetailsLoaded) {
            sharedPreferences?.setString(
                LocaleStorageKey.userProfileImage,
                state.portfolioGetModel.result?.picture?.first.url ??
                    "https://res.cloudinary.com/devatchannel/image/upload/v1602752402/avatar/avatar_cugq40.png");
            // route Space screen after saving userProfile Image
            if (buildContext.widget.runtimeType ==
                const SplashScreen().runtimeType) {
              Timer(const Duration(seconds: 3), () => logInNavigator());
            }
          }
        },
        child: Center(
          child: SvgPicture.asset(
            AppSvg.logo,
            height: height * .25,
          ),
        ),
      ),
    );
  }
}
