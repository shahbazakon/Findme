import 'package:find_me/core/constants/common_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/Input Field/custom_test_field_2.dart';
import '../../../../core/widget/custom_appbar.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Personal Details"),
      body: Padding(
        padding: primaryPadding,
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomTestField2(
              controller: firstNameController,
              label: "First Name",
              hintText: "Enter First Name",
            ),
            CustomTestField2(
              controller: middleNameController,
              label: "Middle Name",
              hintText: "Enter Middle Name",
            ),
            CustomTestField2(
              controller: lastNameController,
              label: "Last Name",
              hintText: "Enter Last Name",
            ),
          ],
        )),
      ),
    );
  }
}
