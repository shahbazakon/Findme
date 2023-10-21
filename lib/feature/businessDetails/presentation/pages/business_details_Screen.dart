import 'package:file_picker/file_picker.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants_variables.dart';
import '../../../../core/constants/theme_contants.dart';
import '../../../../core/helper/formaters.dart';
import '../../../../core/helper/validator.dart';
import '../../../../core/utils/utils_methods.dart';
import '../../../../core/widget/Input Field/county_code_picker.dart';
import '../../../../core/widget/Input Field/custom_test_field_2.dart';
import '../../../../core/widget/button/add_more_button.dart';
import '../../../../core/widget/button/app_switch_button.dart';
import '../../../../core/widget/custom_appbar.dart';

class BusinessDetailsScreen extends StatefulWidget {
  const BusinessDetailsScreen({super.key});

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  bool emailSwitchValue = false;
  bool addressSwitchValue = false;
  bool phone1SwitchValue = false;
  bool phone2SwitchValue = false;
  FilePickerResult? pickedLetterImage;
  FilePickerResult? pickedCoverImage;
  FilePickerResult? pickedVideo;
  FilePickerResult? pickedResume;
  FilePickerResult? pickedTranscript;
  DateTime? pickedDate;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _prefixController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumber1Controller = TextEditingController();
  final TextEditingController _phoneNumber2Controller = TextEditingController();
  final TextEditingController _coverImageController = TextEditingController();
  final TextEditingController _coverLetterController = TextEditingController();
  final TextEditingController _resumeController = TextEditingController();
  final TextEditingController _transcriptController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
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
  final List<TextEditingController> _certificationsController = [
    TextEditingController()
  ];
  TextFieldValidator validator = TextFieldValidator();

  // dispose Controllers
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
    _dobController.dispose();
    _videoController.dispose();
    _coverImageController.dispose();
    _coverLetterController.dispose();
    _resumeController.dispose();
    _transcriptController.dispose();
    _programmingLanguageController.dispose();
    for (var element in _socialMediaURLController) {
      element.dispose();
    }
    for (var element in _projectsController) {
      element.dispose();
    }
    for (var element in _skillsController) {
      element.dispose();
    }
    for (var element in _certificationsController) {
      element.dispose();
    }
    super.dispose();
  }

  // Select Prefix
  void _selectPrefix() async {
    String? selectedPrefix = await openSelectionDialog(
        data: namePrefixList, title: 'Select Name Prefix');
    if (selectedPrefix != null) {
      setState(() {
        _prefixController.text = selectedPrefix;
      });
    }
  }

  // Select Import Images
  void _pickCoverLetter() async {
    pickedLetterImage = await pickFileFromFileManager(type: FileType.image);
    ;
    if (pickedLetterImage != null) {
      setState(() {
        _coverImageController.text = pickedLetterImage!.names.toString();
      });
    }
  }

  // Select Import Images
  void _pickCoverImage() async {
    pickedCoverImage = await pickFileFromFileManager(type: FileType.image);
    ;
    if (pickedCoverImage != null) {
      setState(() {
        _coverImageController.text = pickedCoverImage!.names.toString();
      });
    }
  }

  // Select Import Resume
  void _pickResume() async {
    pickedResume = await pickFileFromFileManager();
    if (pickedResume != null) {
      setState(() {
        _resumeController.text = pickedResume!.names.toString();
      });
    }
  }

  // Select Import Resume
  void _pickTranscript() async {
    pickedTranscript = await pickFileFromFileManager();
    if (pickedTranscript != null) {
      setState(() {
        _resumeController.text = pickedTranscript!.names.toString();
      });
    }
  }

  // Select Import Videos
  void _pickVideo() async {
    pickedVideo = await pickFileFromFileManager(type: FileType.video);
    ;
    if (pickedVideo != null) {
      setState(() {
        _videoController.text = pickedVideo!.names.toString();
      });
    }
  }

  // Select Import Videos
  void _pickDate() async {
    pickedDate = await appDatePicker();
    ;
    if (pickedDate != null) {
      setState(() {
        _dobController.text = dateFormatter1.format(pickedDate!);
      });
    }
  }

  // Select Prefix
  void _selectProgrammingLanguage() async {
    String? selectedLanguage = await openSelectionDialog(
        data: programmingLanguageList, title: 'Select Programming Language');
    if (selectedLanguage != null) {
      setState(() {
        _programmingLanguageController.text = selectedLanguage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Business Details"),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(
            parent:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
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
              CustomTestField2(
                controller: _dobController,
                label: "Date Of Birth",
                hintText: "DD/MM/YYYY",
                showCalendarIcon: true,
                readOnly: true,
                onTap: _pickDate,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 85,
                    child: CustomTestField2(
                      controller: _emailController,
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
              CustomTestField2(
                controller: _addressLine1Controller,
                label: "Address",
                hintText: "Address Line 1",
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
                        value: phone1SwitchValue,
                        onChanged: (value) {
                          phone1SwitchValue = value;
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
                        value: phone2SwitchValue,
                        onChanged: (value) {
                          phone2SwitchValue = value;
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 85,
                    child: Column(
                      children: _certificationsController
                          .asMap()
                          .entries
                          .map((entry) => CustomTestField2(
                                controller: entry.value,
                                label: entry.key + 1 == 1
                                    ? "Certifications"
                                    : 'Certifications ${entry.key + 1}',
                                hintText: "Add Certifications",
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
                        _certificationsController.add(TextEditingController());
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              CustomTestField2(
                controller: _resumeController,
                label: "Resume",
                hintText: "Upload Resume",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickResume,
              ),
              CustomTestField2(
                controller: _transcriptController,
                label: "Transcript",
                hintText: "Upload Transcript",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickTranscript,
              ),
              CustomTestField2(
                controller: _coverLetterController,
                label: "Cover Letter",
                hintText: "Upload Cover Letter",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickCoverLetter,
              ),
              CustomTestField2(
                controller: _coverImageController,
                label: "Cover Image",
                hintText: "Upload Image",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickCoverImage,
              ),
              CustomTestField2(
                controller: _videoController,
                label: "Video",
                validator: (value) => validator.videoValidator(value),
                hintText: "Upload Video",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickVideo,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: AppButton(
                    label: "Save",
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          )),
        ),
      ),
    );
  }
}
