import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/contacts/presentation/pages/contacts_screen.dart';
import 'package:find_me/feature/dashboard/presentation/widget/dashboard_navigation_bar.dart';
import 'package:find_me/feature/home_features/home/presentation/pages/home_screen.dart';
import 'package:find_me/feature/settings_features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/local_storege_key.dart';
import '../../../Profile/presentation/pages/profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  String barcode = 'Tap  to scan';

  @override
  void initState() {
    setValue();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setValue() async {
    await sharedPreferences?.setBool(LocaleStorageKey.isLoggedIn, true);
  }

  Future<void> qrScanner() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AiBarcodeScanner(
            // validator: (value) {
            //   return value.startsWith('https://');
            // },
            canPop: true,
            onScan: (String value) {
              debugPrint(value);
              setState(() {
                barcode = value;
              });
              showSnackBar(title: barcode);
            },
            onDetect: (p0) {},
            onDispose: () {
              debugPrint("Barcode scanner disposed!");
            },
            controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: FloatingActionButton(
          onPressed: qrScanner,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Image.asset(
            AppIcons.camera,
            height: 30,
          ),
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
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}
