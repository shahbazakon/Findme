import 'package:file_picker/file_picker.dart';
import 'package:find_me/core/constants/constants_variables.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/helper/validator.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/county_code_picker.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field_2.dart';
import 'package:find_me/core/widget/button/add_more_button.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MatrimonyDetailsScreen extends StatefulWidget {
  const MatrimonyDetailsScreen({super.key});

  @override
  State<MatrimonyDetailsScreen> createState() => _MatrimonyDetailsScreenState();
}

class _MatrimonyDetailsScreenState extends State<MatrimonyDetailsScreen> {
  bool emailSwitchValue = false;
  bool addressSwitchValue = false;
  FilePickerResult? pickedLetterImage;
  FilePickerResult? pickedCoverImage;
  FilePickerResult? pickedVideo;
  FilePickerResult? pickedResume;
  FilePickerResult? pickedTranscript;
  DateTime? pickedDate;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _parentsOccupationController =
      TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _prefixController = TextEditingController();
  final TextEditingController _educationLevelController =
      TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  final TextEditingController _childrenController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _prayersController = TextEditingController();
  final TextEditingController _casteController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _selfPhoneNumber1Controller =
      TextEditingController();
  final TextEditingController _officePhoneNumber2Controller =
      TextEditingController();
  final TextEditingController _coverImageController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final List<TextEditingController> _socialMediaURLController = [
    TextEditingController()
  ];
  final List<TextEditingController> _likesController = [
    TextEditingController()
  ];
  final List<TextEditingController> _dislikesController = [
    TextEditingController()
  ];
  TextFieldValidator validator = TextFieldValidator();

  // dispose Controllers
  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _occupationController.dispose();
    _parentsOccupationController.dispose();
    _aboutController.dispose();
    _prefixController.dispose();
    _educationLevelController.dispose();
    _maritalStatusController.dispose();
    _childrenController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _religionController.dispose();
    _prayersController.dispose();
    _casteController.dispose();
    _descriptionController.dispose();
    _emailController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _countryCodeController.dispose();
    _selfPhoneNumber1Controller.dispose();
    _officePhoneNumber2Controller.dispose();
    _dobController.dispose();
    _videoController.dispose();
    _coverImageController.dispose();
    for (var element in _socialMediaURLController) {
      element.dispose();
    }
    for (var element in _likesController) {
      element.dispose();
    }
    for (var element in _dislikesController) {
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

  // Select Education Level
  void _selectEducationLevel() async {
    String? selectedEducationLevel = await openSelectionDialog(
        data: educationLevelList, title: 'Select Education Level');
    if (selectedEducationLevel != null) {
      setState(() {
        _educationLevelController.text = selectedEducationLevel;
      });
    }
  }

  // Select Marital Status
  void _selectMaritalStatus() async {
    String? selectedMaritalStatus = await openSelectionDialog(
        data: maritalStatusList, title: 'Select Marital Status');
    if (selectedMaritalStatus != null) {
      setState(() {
        _maritalStatusController.text = selectedMaritalStatus;
      });
    }
  } // Select Marital Status

  void _selectChildren() async {
    //Children
    String? selectedMaritalStatus = await openSelectionDialog(
        data: numberList, title: 'Select Children(if any)');
    if (selectedMaritalStatus != null) {
      setState(() {
        _childrenController.text = selectedMaritalStatus;
      });
    }
  }

  // Select Religion
  void _selectReligion() async {
    //Children
    String? selectedReligion =
        await openSelectionDialog(data: religionList, title: 'Select Religion');
    if (selectedReligion != null) {
      setState(() {
        _religionController.text = selectedReligion;
      });
    }
  }

  void _selectPrayers() async {
    //Children
    String? selectedPrayers =
        await openSelectionDialog(data: prayerList, title: 'Select Religion');
    if (selectedPrayers != null) {
      setState(() {
        _prayersController.text = selectedPrayers;
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

  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: "Matrimony Details"),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(
            parent:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
        child: Container(
          padding: primaryPadding,
          margin: const EdgeInsets.only(bottom: 20, top: 10),
          child: Form(
              child: Column(
            children: [
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
                controller: _occupationController,
                label: "Occupation",
                hintText: "Enter Occupation",
              ),
              CustomTestField2(
                controller: _aboutController,
                label: "About Yourself",
                hintText: "Let others know a little bit about you!",
                maxLines: 4,
              ),
              CustomTestField2(
                controller: _parentsOccupationController,
                label: "Parents Occupation",
                hintText: "Enter Parents Occupation",
              ),
              CustomTestField2(
                controller: _educationLevelController,
                label: "Education Level",
                hintText: "Select Education",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectEducationLevel,
              ),
              CustomTestField2(
                controller: _maritalStatusController,
                label: "Marital Status",
                hintText: "Select Status",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectMaritalStatus,
              ),
              CustomTestField2(
                controller: _childrenController,
                label: "Children(If Any)",
                hintText: "Select",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectChildren,
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
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTestField2(
                      controller: _heightController,
                      label: "Height",
                      hintText: "In feet",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTestField2(
                      controller: _weightController,
                      label: "Weight",
                      hintText: "In Kg",
                    ),
                  ),
                ],
              ),
              CustomTestField2(
                controller: _religionController,
                label: "Religion",
                hintText: "Select",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectReligion,
              ),
              CustomTestField2(
                controller: _casteController,
                label: "Caste(If Any)",
                hintText: "Enter Caste",
              ),
              CustomTestField2(
                controller: _prayersController,
                label: "Prayers(Optional)",
                hintText: "Select",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectPrayers,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 85,
                    child: Column(
                      children: _likesController
                          .asMap()
                          .entries
                          .map((entry) => CustomTestField2(
                                controller: entry.value,
                                label: entry.key + 1 == 1
                                    ? "Things I like to do?"
                                    : null,
                                hintText: "Add Likes",
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
                        _likesController.add(TextEditingController());
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
                      children: _dislikesController
                          .asMap()
                          .entries
                          .map((entry) => CustomTestField2(
                                controller: entry.value,
                                label: entry.key + 1 == 1
                                    ? "Things I do not like to do?"
                                    : null,
                                hintText: "Add Dislikes",
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
                        _dislikesController.add(TextEditingController());
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              CustomTestField2(
                controller: _descriptionController,
                label: "Ideal Match(Describe)",
                hintText: "EDescribe your preferences",
                maxLines: 4,
              ),
              CustomTestField2(
                controller: _emailController,
                label: "Email",
                hintText: "Enter Email",
              ),
              CustomTestField2(
                controller: _addressLine1Controller,
                label: "Office Address",
                hintText: "Address Line 1",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTestField2(
                controller: _addressLine2Controller,
                hintText: "Address Line 2",
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
                    flex: 82,
                    child: CustomTestField2(
                      controller: _selfPhoneNumber1Controller,
                      label: "Phone Number(Self)",
                      hintText: "Phone Number",
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
                    flex: 82,
                    child: CustomTestField2(
                      controller: _officePhoneNumber2Controller,
                      label: "Phone Number(Parents)",
                      hintText: "Phone Number",
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
