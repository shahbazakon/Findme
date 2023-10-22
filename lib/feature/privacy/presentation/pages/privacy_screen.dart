import 'package:flutter/material.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/widget/custom_appbar.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Privacy"),
      body: Padding(
        padding: primaryPadding,
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
