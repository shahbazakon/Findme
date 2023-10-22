import 'package:flutter/material.dart';

import '../../../../core/constants/theme_constants.dart';
import '../../../../core/widget/custom_appbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Notification"),
      body: Padding(
        padding: primaryPadding,
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
