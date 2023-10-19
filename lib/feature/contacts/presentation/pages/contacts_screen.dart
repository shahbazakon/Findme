import 'package:find_me/core/constants/common_ui.dart';
import 'package:find_me/feature/contacts/presentation/widget/contacts_list_tile.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Contacts"),
      body: Padding(
        padding: primaryPadding,
        child: Column(
          children: [
            CustomSearchBar(
              searchController: searchController,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ContactsListTile(
                    title: 'Mustafa Jamail',
                    subTitle: '@Mustaja',
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
