import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/app_assets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, required this.searchController, this.onChanged});

  final TextEditingController searchController;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        onChanged: onChanged,
        controller: searchController,
        decoration: InputDecoration(
            hintText: translate?.search,
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
