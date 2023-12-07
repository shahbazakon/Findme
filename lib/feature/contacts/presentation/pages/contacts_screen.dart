import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:find_me/feature/contacts/presentation/widget/contacts_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/widget/Input Field/custom_searchbar.dart';
import '../../../../core/widget/custom_appbar.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    String? userId = sharedPreferences!.getString(LocaleStorageKey.userID);
    context.read<ContactsCubit>().fetchContactList(userID: userId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: translate!.contacts),
      body: Padding(
        padding: primaryPadding,
        child: Column(
          children: [
            CustomSearchBar(
              searchController: searchController,
            ),
            Expanded(
              child: ListView.builder(
                physics: const ScrollPhysics(
                    parent: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics())),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ContactsListTile(
                    title: translate.translate('Mustafa Jamail'),
                    subTitle: translate.translate('@Mustaja'),
                    leadingImage:
                        "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3569&q=80",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
