import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/common_ui.dart';
import '../../../../core/utils/app_assets.dart';
import '../widget/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          AppIcons.camera,
          height: 35,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Image.asset(AppIcons.store, height: 20),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(AppIcons.phoneBook, height: 20),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(AppIcons.settings, height: 20),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(AppIcons.user, height: 20),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          AppIcons.search,
                          height: 10,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
