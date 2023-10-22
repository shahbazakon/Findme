import 'package:flutter/material.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/widget/custom_appbar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Help"),
      body: Padding(
        padding: primaryPadding,
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
