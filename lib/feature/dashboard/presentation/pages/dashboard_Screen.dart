import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/contacts/presentation/pages/contacts_screen.dart';
import 'package:find_me/feature/dashboard/presentation/widget/dashboard_navigation_bar.dart';
import 'package:find_me/feature/home_features/home/presentation/pages/home_screen.dart';
import 'package:find_me/feature/settings_features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: FloatingActionButton(
          child: Image.asset(
            AppIcons.camera,
            height: 30,
          ),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: HomeNavigationBar(
          pageController: pageController, selectedIndex: selectedIndex),
      body: SizedBox(
        height: height,
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          controller: pageController,
          children: const <Widget>[
            HomeScreen(),
            ContactsScreen(),
            SettingsScreen(),
            Center(
              child: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
