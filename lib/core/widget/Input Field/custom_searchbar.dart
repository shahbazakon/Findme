import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key, required this.searchController});

  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle:
                SubTitleHelper.h8.copyWith(color: AppFontsColors.lightGrey3),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            prefixIcon: Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                AppIcons.search,
                height: 8,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
