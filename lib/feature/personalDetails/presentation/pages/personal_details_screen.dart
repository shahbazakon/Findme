import 'package:find_me/core/constants/common_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils_methods.dart';
import '../../../../core/widget/Input Field/county_code_picker.dart';
import '../../../../core/widget/Input Field/custom_test_field_2.dart';
import '../../../../core/widget/button/add_more_button.dart';
import '../../../../core/widget/button/app_switch_button.dart';
import '../../../../core/widget/custom_appbar.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  bool emailSwitchValue = false;
  bool addressSwitchValue = false;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _prefixController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumber1Controller = TextEditingController();
  final TextEditingController _phoneNumber2Controller = TextEditingController();
  final TextEditingController _programmingLanguageController =
      TextEditingController();
  final List<TextEditingController> _socialMediaURLController = [
    TextEditingController()
  ];
  final List<TextEditingController> _projectsController = [
    TextEditingController()
  ];
  final List<TextEditingController> _skillsController = [
    TextEditingController()
  ];

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _prefixController.dispose();
    _emailController.dispose();
    _addressLine1Controller.dispose();
    _countryCodeController.dispose();
    _phoneNumber1Controller.dispose();
    _phoneNumber2Controller.dispose();
    for (var element in _socialMediaURLController) {
      element.dispose();
    }
    for (var element in _projectsController) {
      element.dispose();
    }
    for (var element in _skillsController) {
      element.dispose();
    }
    super.dispose();
  }

  // Select Prefix
  void _selectPrefix() async {
    List<String> dataList = ["Mr.", "Mrs.", "Ms"];
    String? selectedPrefix =
        await openSelectionDialog(data: dataList, title: 'Select Name Prefix');
    if (selectedPrefix != null) {
      setState(() {
        _prefixController.text = selectedPrefix;
      });
    }
  }

  // Select Prefix
  void _selectProgrammingLanguage() async {
    List<String> dataList = [
      "Java",
      "Python",
      "JavaScript",
      "C#",
      "C++",
      "Ruby",
      "Swift",
      "Kotlin",
      "Dart",
      "Go",
      "TypeScript",
      "PHP",
      "Rust",
      "Objective-C",
      "HTML",
      "CSS",
      "SQL",
      "Shell",
      "Scala",
      "Perl",
    ];
    String? selectedLanguage = await openSelectionDialog(
        data: dataList, title: 'Select Programming Language');
    if (selectedLanguage != null) {
      setState(() {
        _programmingLanguageController.text = selectedLanguage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Personal Details"),
      body: SingleChildScrollView(
        child: Container(
          padding: primaryPadding,
          margin: const EdgeInsets.only(bottom: 20),
          child: Form(
              child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomTestField2(
                controller: _prefixController,
                label: "Prefix",
                hintText: "Enter Prefix",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectPrefix,
              ),
              CustomTestField2(
                controller: _firstNameController,
                label: "First Name",
                hintText: "Enter First Name",
              ),
              CustomTestField2(
                controller: _middleNameController,
                label: "Middle Name",
                hintText: "Enter Middle Name",
              ),
              CustomTestField2(
                controller: _lastNameController,
                label: "Last Name",
                hintText: "Enter Last Name",
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 85,
                    child: CustomTestField2(
                      controller: _lastNameController,
                      label: "Email",
                      hintText: "Enter Email",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AppSwitchButton(
                        value: emailSwitchValue,
                        onChanged: (value) {
                          emailSwitchValue = value;
                          setState(
                            () {},
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 85,
                    child: CustomTestField2(
                      controller: _addressLine1Controller,
                      label: "Address",
                      hintText: "Address Line 1",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AppSwitchButton(
                        value: addressSwitchValue,
                        onChanged: (value) {
                          addressSwitchValue = value;
                          setState(
                            () {},
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 18,
                    child: Container(
                      decoration: appBoxDecoration,
                      margin: const EdgeInsets.only(top: 30),
                      child: CustomCountryCodePicker(
                        onChanged: (value) {
                          _countryCodeController.text = value.code!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 68,
                    child: CustomTestField2(
                      controller: _phoneNumber1Controller,
                      label: "Phone Number",
                      hintText: "Phone Number",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AppSwitchButton(
                        value: addressSwitchValue,
                        onChanged: (value) {
                          addressSwitchValue = value;
                          setState(
                            () {},
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 18,
                    child: Container(
                      decoration: appBoxDecoration,
                      margin: const EdgeInsets.only(top: 30),
                      child: CustomCountryCodePicker(
                        onChanged: (value) {
                          _countryCodeController.text = value.code!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 68,
                    child: CustomTestField2(
                      controller: _phoneNumber2Controller,
                      label: "Phone Number(additional)",
                      hintText: "Phone Number",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AppSwitchButton(
                        value: addressSwitchValue,
                        onChanged: (value) {
                          addressSwitchValue = value;
                          setState(
                            () {},
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              CustomTestField2(
                controller: _programmingLanguageController,
                label: "Programming Language",
                hintText: "Enter Language",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectProgrammingLanguage,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 85,
                    child: Column(
                      children: _socialMediaURLController
                          .asMap()
                          .entries
                          .map((entry) => CustomTestField2(
                                controller: entry.value,
                                label: entry.key + 1 == 1
                                    ? "Social Media"
                                    : 'Social Media ${entry.key + 1}',
                                hintText: "Add Profile URL",
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: AddMoreButton(
                      margin: const EdgeInsets.only(top: 35),
                      onTap: () {
                        _socialMediaURLController.add(TextEditingController());
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 85,
                    child: Column(
                      children: _projectsController
                          .asMap()
                          .entries
                          .map((entry) => CustomTestField2(
                                controller: entry.value,
                                label: entry.key + 1 == 1
                                    ? "Projects"
                                    : 'Projects ${entry.key + 1}',
                                hintText: "Add Projects",
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: AddMoreButton(
                      margin: const EdgeInsets.only(top: 35),
                      onTap: () {
                        _projectsController.add(TextEditingController());
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 85,
                    child: Column(
                      children: _skillsController
                          .asMap()
                          .entries
                          .map((entry) => CustomTestField2(
                                controller: entry.value,
                                label: entry.key + 1 == 1
                                    ? "Skills"
                                    : 'Skills ${entry.key + 1}',
                                hintText: "Add Skills",
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: AddMoreButton(
                      margin: const EdgeInsets.only(top: 35),
                      onTap: () {
                        _skillsController.add(TextEditingController());
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
