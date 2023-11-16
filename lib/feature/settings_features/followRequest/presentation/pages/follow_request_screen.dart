import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/widget/Input%20Field/custom_searchbar.dart';
import 'package:find_me/core/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widget/follow_request_list_tile.dart';

class FollowRequestScreen extends StatefulWidget {
  const FollowRequestScreen({super.key});

  @override
  State<FollowRequestScreen> createState() => _FollowRequestScreenState();
}

class _FollowRequestScreenState extends State<FollowRequestScreen> {
  TextEditingController searchController = TextEditingController();
  AppLocalizations? translate;

  @override
  void initState() {
    translate = AppLocalizations.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: translate!.followRequest),
      body: Column(
        children: [
          Padding(
            padding: primaryPadding,
            child: CustomSearchBar(
              searchController: searchController,
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return FollowRequestListTile(
                    title: translate!.translate('Mustafa Jamail'),
                    subTitle: translate!.translate('@Mustaja'),
                    leadingImage:
                        "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3569&q=80",
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.lightGrey2,
                    thickness: 1,
                    height: 0,
                  );
                },
                itemCount: 10),
          )
        ],
      ),
    );
    ;
  }
}
