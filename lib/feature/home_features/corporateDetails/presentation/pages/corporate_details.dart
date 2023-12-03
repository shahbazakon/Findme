import 'package:file_picker/file_picker.dart';
import 'package:find_me/core/constants/constants_variables.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/helper/validator.dart';
import 'package:find_me/core/models/archievement_model.dart';
import 'package:find_me/core/models/mobile_model.dart';
import 'package:find_me/core/models/protfolio_model.dart';
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
import 'package:find_me/feature/home_features/corporateDetails/presentation/cubit/corporate_details_cubit.dart';
import 'package:find_me/feature/home_features/corporateDetails/presentation/cubit/corporate_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CorporateDetailsScreen extends StatefulWidget {
  const CorporateDetailsScreen({super.key});

  @override
  State<CorporateDetailsScreen> createState() => _CorporateDetailsScreenState();
}

class _CorporateDetailsScreenState extends State<CorporateDetailsScreen> {
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
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _aboutBusinessController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _prefixController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _countryCode1Controller = TextEditingController();
  final TextEditingController _countryCode2Controller = TextEditingController();
  final TextEditingController _officePhoneNumber1Controller =
      TextEditingController();
  final TextEditingController _officePhoneNumber2Controller =
      TextEditingController();
  final TextEditingController _coverImageController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final List<TextEditingController> _socialMediaURLController = [
    TextEditingController()
  ];
  final List<TextEditingController> _achievementsController = [
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
    _businessNameController.dispose();
    _aboutBusinessController.dispose();
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _prefixController.dispose();
    _emailController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _countryCode1Controller.dispose();
    _officePhoneNumber1Controller.dispose();
    _officePhoneNumber2Controller.dispose();
    _dobController.dispose();
    _videoController.dispose();
    _coverImageController.dispose();
    for (var element in _socialMediaURLController) {
      element.dispose();
    }
    for (var element in _achievementsController) {
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
  }

  // Select Prefix
  void _selectPrefix() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    String? selectedPrefix = await openSelectionDialog(
        data: namePrefixList,
        title: '${translate!.select} ${translate!.name} ${translate!.prefix}');
    if (selectedPrefix != null) {
      setState(() {
        _prefixController.text = selectedPrefix;
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

  void submitForm() {
    AppLocalizations? translate = AppLocalizations.of(context);
    context.read<CorporateDetailsCubit>().createCorporateDetails(
            data: PortfolioModel(
                result: PortfolioResult(
          // TODO:Business fame Field missing
          // TODO:about Business fame Field missing
          cardTitle: "Business",
          suffix: _prefixController.text,
          firstName: _firstNameController.text,
          middleName: _middleNameController.text,
          lastName: _lastNameController.text,
          dob: pickedDate,
          primaryEmail: _emailController.text.trim(),
          primaryAddress: _addressLine1Controller.text,
          secondaryAddress: _addressLine2Controller.text,
          mobile: [
            Mobile(
                phoneCode: _countryCode1Controller.text,
                number: _officePhoneNumber1Controller.text,
                label: "${translate!.office} ${translate!.phoneNumber}"),
            Mobile(
                phoneCode: _countryCode2Controller.text,
                number: _officePhoneNumber2Controller.text,
                label:
                    "${translate!.office} ${translate!.phoneNumber}(${translate.additional})"),
          ],
          social: _socialMediaURLController.map((e) {
            return Social(title: e.text);
          }).toList(),
          achievements: _achievementsController.map((e) {
            return Achievement(title: e.text);
          }).toList(),
          //TODO: add projects
          //TODO: cover Image
          //TODO: upload Video
        )));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar:
          CustomAppbar(title: "${translate!.corporate} ${translate!.details}"),
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
                controller: _businessNameController,
                label: "${translate!.business} ${translate!.name}",
                hintText:
                    "${translate!.enter} ${translate!.business} ${translate!.name}",
              ),
              CustomTestField2(
                controller: _aboutBusinessController,
                label: "${translate!.about} ${translate!.business}",
                hintText: translate!.about,
                maxLines: 4,
              ),
              CustomTestField2(
                controller: _prefixController,
                label: translate!.prefix,
                hintText: "${translate!.enter} ${translate!.prefix}",
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
                label: "${translate!.office} ${translate!.address}",
                hintText: "${translate!.addressLine} 1",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTestField2(
                controller: _addressLine2Controller,
                hintText: "${translate!.addressLine} 2",
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
                      controller: _officePhoneNumber1Controller,
                      label: "${translate!.office} ${translate!.phoneNumber}",
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
                      controller: _officePhoneNumber2Controller,
                      label:
                          "${translate!.phoneNumber}(${translate!.additional}})",
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
                                hintText:
                                    "${translate!.add} ${translate!.profile} ${translate!.url}",
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
                      children: _achievementsController
                          .asMap()
                          .entries
                          .map((entry) => CustomTestField2(
                                controller: entry.value,
                                label: entry.key + 1 == 1
                                    ? translate!.achievements
                                    : '${translate!.achievements} ${entry.key + 1}',
                                hintText:
                                    "${translate!.add} ${translate!.achievements}",
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
                        _achievementsController.add(TextEditingController());
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              CustomTestField2(
                controller: _coverImageController,
                label: translate!.coverImage,
                hintText: "${translate!.upload} ${translate!.image}",
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
                child:
                    BlocConsumer<CorporateDetailsCubit, CorporateDetailsState>(
                  listener: (context, state) {
                    if (state is CorporateDetailsLoaded) {
                      cupertinoNavigator(
                          screenName: const SuccessScreen(
                        subTitle: "Corporate Details Added Successfully ",
                        isHomeButtonVisible: false,
                      ));
                    } else if (state is CorporateDetailsError) {
                      showSnackBar(title: state.errorMsg);
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                        label: translate!.save,
                        isLoading: state is CorporateDetailsLoading,
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
