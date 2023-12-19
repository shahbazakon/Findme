import 'package:file_picker/file_picker.dart';
import 'package:find_me/core/constants/constants_variables.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/helper/validator.dart';
import 'package:find_me/core/models/mobile_model.dart';
import 'package:find_me/core/models/social_model.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/county_code_picker.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field_2.dart';
import 'package:find_me/core/widget/button/add_more_button.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_appbar.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/success_screen.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/data/models/matrimonial_%20Model.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/presentation/cubit/matrimonial_portfolio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController _countryCode1Controller = TextEditingController();
  final TextEditingController _countryCode2Controller = TextEditingController();
  final TextEditingController _selfPhoneNumber1Controller =
      TextEditingController();
  final TextEditingController _parentsPhoneNumber2Controller =
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
    _countryCode1Controller.dispose();
    _selfPhoneNumber1Controller.dispose();
    _parentsPhoneNumber2Controller.dispose();
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

  // Select Education Level
  void _selectEducationLevel() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    String? selectedEducationLevel = await openSelectionDialog(
        data: educationLevelList,
        title:
            '${translate!.select} ${translate!.education} ${translate!.level}');
    if (selectedEducationLevel != null) {
      setState(() {
        _educationLevelController.text = selectedEducationLevel;
      });
    }
  }

  // Select Marital Status
  void _selectMaritalStatus() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    String? selectedMaritalStatus = await openSelectionDialog(
        data: maritalStatusList,
        title: '${translate!.select} ${translate!.maritalStatus}');
    if (selectedMaritalStatus != null) {
      setState(() {
        _maritalStatusController.text = selectedMaritalStatus;
      });
    }
  } // Select Marital Status

  void _selectChildren() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    //Children
    String? selectedMaritalStatus = await openSelectionDialog(
        data: numberList,
        title:
            '${translate!.select} ${translate!.children}(${translate!.ifAny})');
    if (selectedMaritalStatus != null) {
      setState(() {
        _childrenController.text = selectedMaritalStatus;
      });
    }
  }

  // Select Religion
  void _selectReligion() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    //Children
    String? selectedReligion = await openSelectionDialog(
        data: religionList,
        title: '${translate!.select} ${translate!.religion}');
    if (selectedReligion != null) {
      setState(() {
        _religionController.text = selectedReligion;
      });
    }
  }

  void _selectPrayers() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    //Children
    String? selectedPrayers = await openSelectionDialog(
        data: prayerList, title: '${translate!.select} ${translate!.religion}');
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

  //API call
  void apiCall() {
    //TODO: @shahbaz Add upload image and video
    context.read<MatrimonialDetailsPortfolioCubit>().createMatrimonialPortfolio(
            data: MatrimonialModel(
                result: MatrimonialResult(
          cardTitle: "Matrimonial",
          suffix: _prefixController.text,
          firstName: _firstNameController.text,
          middleName: _middleNameController.text,
          lastName: _lastNameController.text,
          occupation: _occupationController.text,
          educationLevel: _educationLevelController.text,
          maritalStatus: _maritalStatusController.text,
          numberOfChildren: _childrenController.text,
          dob: pickedDate,
          height: _heightController.text,
          weight: _weightController.text,
          religion: _religionController.text,
          caste: _casteController.text,
          prayers: _prayersController.text,
          thingsLikeToDo: _likesController.map((e) => e.text).toList(),
          badHabbit: _dislikesController.map((e) => e.text).toList(),
          primaryAddress: _addressLine1Controller.text,
          secondaryAddress: _addressLine2Controller.text,
          primaryEmail: _emailController.text.trim(),
          mobile: [
            Mobile(
                label: "PhoneNumber Self",
                number: _selfPhoneNumber1Controller.text)
          ],
          parentPhoneNumber: _countryCode1Controller.text +
              _parentsPhoneNumber2Controller.text,
          social: _socialMediaURLController.map((e) {
            return Social(title: e.text);
          }).toList(),
        )));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar:
          CustomAppbar(title: "${translate!.matrimony} ${translate!.details}"),
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
                controller: _occupationController,
                label: translate!.occupation,
                hintText: "${translate!.enter} ${translate!.occupation}",
              ),
              CustomTestField2(
                controller: _aboutController,
                label: "${translate!.about} ${translate!.yourself}",
                hintText: "Let others know a little bit about you!",
                maxLines: 4,
              ),
              CustomTestField2(
                controller: _parentsOccupationController,
                label: "${translate!.parents} ${translate!.occupation}",
                hintText:
                    "${translate!.enter} ${translate!.parents} ${translate!.occupation}",
              ),
              CustomTestField2(
                controller: _educationLevelController,
                label: "${translate!.education} ${translate!.level}",
                hintText: "${translate!.select} ${translate!.education}",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectEducationLevel,
              ),
              CustomTestField2(
                controller: _maritalStatusController,
                label: translate!.maritalStatus,
                hintText: "${translate!.select} ${translate!.status}",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectMaritalStatus,
              ),
              CustomTestField2(
                controller: _childrenController,
                label: "${translate!.children}(${translate!.ifAny})",
                hintText: translate!.select,
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectChildren,
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
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTestField2(
                      controller: _heightController,
                      label: translate!.height,
                      hintText: translate!.inFeet,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTestField2(
                      controller: _weightController,
                      label: translate!.weight,
                      hintText: translate!.inKg,
                    ),
                  ),
                ],
              ),
              CustomTestField2(
                controller: _religionController,
                label: translate!.religion,
                hintText: translate!.select,
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectReligion,
              ),
              CustomTestField2(
                controller: _casteController,
                label: "${translate!.caste}(${translate!.ifAny})",
                hintText: "${translate!.enter} ${translate!.caste}",
              ),
              CustomTestField2(
                controller: _prayersController,
                label: "${translate!.prayers}(${translate!.optional})",
                hintText: translate!.select,
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
                                    ? translate!.thingsILikeToDo
                                    : null,
                                hintText:
                                    "${translate!.add} ${translate!.likes}",
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
                                    ? translate!.thingsIDoNotLikeToDo
                                    : null,
                                hintText:
                                    "${translate!.add} ${translate!.dislikes}",
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
                label: "${translate!.idealMatch}(${translate!.describe})",
                hintText: translate!.describeYourPreferences,
                maxLines: 4,
              ),
              CustomTestField2(
                controller: _emailController,
                label: translate!.email,
                hintText: "${translate!.enter} ${translate!.email}",
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
                    flex: 82,
                    child: CustomTestField2(
                      controller: _selfPhoneNumber1Controller,
                      label: "${translate!.phoneNumber}(${translate!.self})",
                      hintText: translate!.phoneNumber,
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
                    flex: 82,
                    child: CustomTestField2(
                      controller: _parentsPhoneNumber2Controller,
                      label: "${translate!.phoneNumber}(${translate!.parents})",
                      hintText: translate!.phoneNumber,
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
                child: BlocConsumer<MatrimonialDetailsPortfolioCubit,
                    MatrimonialPortfolioState>(
                  listener: (context, state) {
                    if (state is MatrimonialPortfolioLoaded) {
                      cupertinoNavigator(
                          screenName: const SuccessScreen(
                        subTitle: "Matrimonial Details Added Successfully ",
                        isHomeButtonVisible: false,
                      ));
                    } else if (state is MatrimonialPortfolioError) {
                      showSnackBar(title: state.errorMsg);
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                        label: translate!.save,
                        isLoading: state is MatrimonialPortfolioLoading,
                        onPressed: apiCall);
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
