import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:find_me/core/constants/constants_variables.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/helper/validator.dart';
import 'package:find_me/core/models/archievement_model.dart';
import 'package:find_me/core/models/mobile_model.dart';
import 'package:find_me/core/models/portfolio_set_model.dart';
import 'package:find_me/core/models/social_model.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/county_code_picker.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field_2.dart';
import 'package:find_me/core/widget/button/add_more_button.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/button/app_switch_button.dart';
import 'package:find_me/core/widget/custom_appbar.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/dialogBox/add_project_pop.dart';
import 'package:find_me/core/widget/project_tile.dart';
import 'package:find_me/core/widget/success_screen.dart';
import 'package:find_me/feature/home_features/academicDetails/presentation/cubit/academic_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AcademicDetailsScreen extends StatefulWidget {
  const AcademicDetailsScreen({super.key});

  @override
  State<AcademicDetailsScreen> createState() => _AcademicDetailsScreenState();
}

class _AcademicDetailsScreenState extends State<AcademicDetailsScreen> {
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
  final TextEditingController _countryCode1Controller = TextEditingController();
  final TextEditingController _countryCode2Controller = TextEditingController();
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
  final List<TextEditingController> _skillsController = [
    TextEditingController()
  ];
  final List<TextEditingController> _certificationsController = [
    TextEditingController()
  ];
  TextFieldValidator validator = TextFieldValidator();

  @override
  void initState() {
    super.initState();
  }

  // dispose Controllers
  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _prefixController.dispose();
    _emailController.dispose();
    _addressLine1Controller.dispose();
    _countryCode1Controller.dispose();
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
    for (var element in _skillsController) {
      element.dispose();
    }
    for (var element in _certificationsController) {
      element.dispose();
    }
    super.dispose();
  }

  // add project
  List<Map<String, dynamic>> projectsList = [];
  void _addProjectDetails(Map<String, dynamic> data) {
    setState(() {
      projectsList.add(data);
    });
    log("projectsList: ${projectsList[0]['startDate'].runtimeType}");
  }

  // Select Prefix
  void _selectPrefix() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    String? selectedPrefix = await openSelectionDialog(
        data: namePrefixList, title: translate!.selectNamePrefix);
    if (selectedPrefix != null) {
      setState(() {
        _prefixController.text = selectedPrefix;
      });
    }
  }

  // Select Import Images
  void _pickCoverLetter() async {
    pickedLetterImage = await pickFileFromFileManager(type: FileType.image);
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
        _transcriptController.text = pickedTranscript!.names.toString();
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
    AppLocalizations? translate = AppLocalizations.of(context);
    String? selectedLanguage = await openSelectionDialog(
        data: programmingLanguageList,
        title: translate!.selectProgrammingLanguage);
    if (selectedLanguage != null) {
      setState(() {
        _programmingLanguageController.text = selectedLanguage;
      });
    }
  }

  //submit Form
  void submitForm() {
    AppLocalizations? translate = AppLocalizations.of(context);
    context.read<AcademicDetailsCubit>().createAcademicDetails(
            data: PortfolioSetModel(
                result: PortfolioSetResult(
          cardTitle: "Academic",
          suffix: _prefixController.text,
          firstName: _firstNameController.text,
          middleName: _middleNameController.text,
          lastName: _lastNameController.text,
          dob: pickedDate,
          primaryEmail: _emailController.text.trim(),
          primaryAddress: _addressLine1Controller.text,
          mobile: [
            Mobile(
                label: translate!.phoneNumber,
                number: _phoneNumber1Controller.text,
                phoneCode: _phoneNumber1Controller.text),
            Mobile(
                label: "${translate.phoneNumber}(${translate.additional})",
                number: _phoneNumber2Controller.text,
                phoneCode: _phoneNumber2Controller.text)
          ],
          social: _socialMediaURLController.map((e) {
            return Social(title: e.text);
          }).toList(),
          programmingLanguage: [_programmingLanguageController.text],
          //TODO: @shahbaz add project request body,
          skills: _skillsController.map((e) => e.text).toList(),
          certification: _certificationsController
              .map((e) => Achievement(title: e.text))
              .toList(),
          //TODO: add document upload body
        )));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppbar(title: translate!.academic + translate!.details),
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
                label: translate!.prefix,
                hintText: translate!.enter + translate!.prefix,
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectPrefix,
              ),
              CustomTestField2(
                controller: _firstNameController,
                label: translate!.firstName,
                hintText: "${translate!.enter} ${translate!.firstName}",
              ),
              CustomTestField2(
                controller: _middleNameController,
                label: translate!.middleName,
                hintText: "${translate!.enter} ${translate!.middleName}",
              ),
              CustomTestField2(
                controller: _lastNameController,
                label: translate!.lastName,
                hintText: "${translate!.enter} ${translate!.lastName}",
              ),
              CustomTestField2(
                controller: _dobController,
                label: translate!.dateOfBirth,
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
                      label: translate!.email,
                      hintText: "${translate!.enter} ${translate!.email}",
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
                label: translate!.address,
                hintText: "${translate!.addressLine} 1",
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
                          _countryCode1Controller.text = value.code!;
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
                      label: translate!.phoneNumber,
                      hintText: translate!.phoneNumber,
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
                          _countryCode2Controller.text = value.code!;
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
                      label:
                          "${translate!.phoneNumber}(${translate!.additional})",
                      hintText: translate!.phoneNumber,
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
                                    ? translate!.socialMedia
                                    : '${translate!.socialMedia} ${entry.key + 1}',
                                hintText: translate!.addProfileURL,
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
                label: translate!.programmingLanguage,
                hintText: "${translate!.enter} ${translate!.language}",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectProgrammingLanguage,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 85,
                      child: CustomTestField2(
                        label: translate!.projects,
                        hintText: "${translate!.add} ${translate!.projects}",
                        readOnly: true,
                        onTap: () async {
                          Map<String, dynamic> newData = await appProjectsPop();
                          _addProjectDetails(newData);
                        },
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: AddMoreButton(
                      margin: const EdgeInsets.only(top: 35),
                      onTap: () async {
                        Map<String, dynamic> newData = await appProjectsPop();
                        _addProjectDetails(newData);
                      },
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: projectsList.length,
                shrinkWrap: true,
                physics:
                    const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return ProjectListTile(
                    title: projectsList[index]['name'],
                    subTitle: projectsList[index]['role'],
                    startDate:
                        "${dateFormatter1.format(projectsList[index]['startDate'])}, ",
                    endDate:
                        "${dateFormatter1.format(projectsList[index]['endDate'])} ",
                    description: projectsList[index]['description'],
                  );
                },
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
                                    ? translate!.skills
                                    : '${translate!.skills} ${entry.key + 1}',
                                hintText:
                                    "${translate!.add} ${translate!.skills}",
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
                                    ? translate!.certifications
                                    : '${translate!.certifications} ${entry.key + 1}',
                                hintText:
                                    "${translate!.add} ${translate!.certifications}",
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
                label: translate!.resume,
                hintText: "${translate!.upload} ${translate!.resume}",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickResume,
              ),
              CustomTestField2(
                controller: _transcriptController,
                label: translate!.transcript,
                hintText: "${translate!.upload} ${translate!.transcript}",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickTranscript,
              ),
              CustomTestField2(
                controller: _coverLetterController,
                label: translate!.coverLetter,
                hintText: "${translate!.upload} ${translate!.coverLetter}",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickCoverLetter,
              ),
              CustomTestField2(
                controller: _coverImageController,
                label: translate!.coverImage,
                hintText: "${translate!.upload} ${translate!.coverImage}",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickCoverImage,
              ),
              CustomTestField2(
                controller: _videoController,
                label: translate!.video,
                validator: (value) => validator.videoValidator(value),
                hintText: "${translate!.upload} ${translate!.video}",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickVideo,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BlocConsumer<AcademicDetailsCubit, AcademicDetailsState>(
                  listener: (context, state) {
                    if (state is AcademicDetailsLoaded) {
                      cupertinoNavigator(
                          screenName: const SuccessScreen(
                        subTitle: "Academic Details Added Successfully ",
                        isHomeButtonVisible: false,
                      ));
                    } else if (state is AcademicDetailsError) {
                      showSnackBar(title: state.errorMsg);
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                        label: translate!.save,
                        isLoading: state is AcademicDetailsLoading,
                        onPressed: submitForm);
                  },
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
