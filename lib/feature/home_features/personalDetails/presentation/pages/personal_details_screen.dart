import 'package:file_picker/file_picker.dart';
import 'package:find_me/core/constants/constants_variables.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/helper/validator.dart';
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
import 'package:find_me/core/widget/success_screen.dart';
import 'package:find_me/feature/home_features/personalDetails/presentation/cubit/presontation_details_cubit.dart';
import 'package:find_me/feature/home_features/personalDetails/presentation/cubit/presontation_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  bool emailSwitchValue = false;
  bool addressSwitchValue = false;
  bool phone1SwitchValue = false;
  bool phone2SwitchValue = false;
  FilePickerResult? pickedImage;
  FilePickerResult? pickedVideo;
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
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final List<TextEditingController> _socialMediaURLController = [
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
    _countryCode1Controller.dispose();
    _phoneNumber1Controller.dispose();
    _phoneNumber2Controller.dispose();
    _dobController.dispose();
    _videoController.dispose();
    _imageController.dispose();
    for (var element in _socialMediaURLController) {
      element.dispose();
    }
    super.dispose();
  }

  // Select Prefix
  void _selectPrefix() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    String? selectedPrefix = await openSelectionDialog(
        data: namePrefixList,
        title: '${translate!.select} ${translate!.name} ${translate!.prefix} ');
    if (selectedPrefix != null) {
      setState(() {
        _prefixController.text = selectedPrefix;
      });
    }
  }

  // Select Import Images
  void _pickImage() async {
    pickedImage = await pickFileFromFileManager(type: FileType.image);
    ;
    if (pickedImage != null) {
      setState(() {
        _imageController.text = pickedImage!.names.toString();
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
    context.read<PersonalDetailsCubit>().createPersonalDetails(
            data: PortfolioSetModel(
                result: PortfolioSetResult(
          cardTitle: "Personal",
          suffix: _prefixController.text,
          firstName: _firstNameController.text,
          middleName: _middleNameController.text,
          lastName: _lastNameController.text,
          dob: pickedDate,
          primaryEmail: _emailController.text,
          primaryAddress: _addressLine1Controller.text,
          mobile: [
            Mobile(
                phoneCode: _countryCode1Controller.text,
                number: _phoneNumber1Controller.text,
                label: translate!.phoneNumber),
            Mobile(
                phoneCode: _countryCode2Controller.text,
                number: _phoneNumber2Controller.text,
                label: "${translate!.phoneNumber}(${translate.additional})"),
          ],
          social: _socialMediaURLController.map((e) {
            return Social(title: e.text);
          }).toList(),
          //TODO: upload image
          //TODO: Upload Video
        )));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar:
          CustomAppbar(title: "${translate!.personal} ${translate.details} "),
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
                label: translate.prefix,
                hintText: "${translate.select} ${translate!.prefix} ",
                readOnly: true,
                showDropdownIcon: true,
                onTap: _selectPrefix,
              ),
              CustomTestField2(
                controller: _firstNameController,
                label: translate.firstName,
                hintText: "${translate.enter} ${translate.firstName}",
              ),
              CustomTestField2(
                controller: _middleNameController,
                label: translate.middleName,
                hintText: "${translate.select} ${translate.middleName}",
              ),
              CustomTestField2(
                controller: _lastNameController,
                label: translate.lastName,
                hintText: "${translate.enter} ${translate.lastName}",
              ),
              CustomTestField2(
                controller: _dobController,
                label: translate.dateOfBirth,
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
                      hintText: "${translate.enter} ${translate.email}",
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
                      label: translate.address,
                      hintText: "${translate.addressLine} 1",
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
                      label: translate.phoneNumber,
                      hintText: translate.phoneNumber,
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
                    flex: 82,
                    child: CustomTestField2(
                      controller: _phoneNumber2Controller,
                      label:
                          "${translate.phoneNumber}(${translate.additional})",
                      hintText: translate.phoneNumber,
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
                                    ? translate.socialMedia
                                    : '${translate.socialMedia} ${entry.key + 1}',
                                hintText:
                                    "${translate.add} ${translate.prefix} ${translate.url}",
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
                controller: _imageController,
                label: translate.image,
                hintText: "${translate.upload} ${translate.image}",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickImage,
              ),
              CustomTestField2(
                controller: _videoController,
                label: translate.video,
                validator: (value) => validator.videoValidator(value),
                hintText: "${translate.upload} ${translate.video}",
                showUploadIcon: true,
                readOnly: true,
                onTap: _pickVideo,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BlocConsumer<PersonalDetailsCubit, PersonalDetailsState>(
                  listener: (context, state) {
                    if (state is PersonalDetailsLoaded) {
                      cupertinoNavigator(
                          screenName: const SuccessScreen(
                        subTitle: "Personal Details Added Successfully ",
                        isHomeButtonVisible: false,
                      ));
                    } else if (state is PersonalDetailsError) {
                      showSnackBar(title: state.errorMsg);
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                        label: translate.save, onPressed: submitForm);
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
