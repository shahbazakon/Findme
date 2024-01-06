import 'dart:developer';

import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/county_code_picker.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/profile_picture_avatar.dart';
import 'package:find_me/feature/auth_featrues/createProfile/data/models/complete_profile_model.dart';
import 'package:find_me/feature/auth_featrues/createProfile/presentation/cubit/create_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  final String id;

  const CreateProfile({super.key, required this.id});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _statusCodeController = TextEditingController();
  final TextEditingController _phoneNumberCodeController =
      TextEditingController();
  XFile? pickedImage;

  ProfileModel? profileModel;

  @override
  void dispose() {
    _phoneNumberCodeController.dispose();
    _countryCodeController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _countryController.dispose();
    _statusCodeController.dispose();
    super.dispose();
  }

  // Submit Form
  Future<void> submitForm() async {
    String? fileType = pickedImage?.name.split(".").last.toString();
    //TODO: solve Upload file Issue
    context.read<CreateProfileCubit>().createProfile(
            data: ProfileModel(
          result: ProfileResult(
              resultId: widget.id,
              name: _nameController.text,
              email: _emailController.text,
              country: _countryController.text,
              phoneCode: _statusCodeController.text,
              ipDetail: IpDetail(
                  countryCode: _countryController.text,
                  state: _statusCodeController.text),
              isLoggedIn: true,
              picture: pickedImage == null
                  ? null
                  : [
                      Cover(
                        url:
                            'data:image/$fileType;base64,${await getBase64File(imageFile: pickedImage!)}',
                        // 'base64,,
                        thumbUrl:
                            'data:image/$fileType;base64,${await getBase64File(imageFile: pickedImage!)}',
                        name: pickedImage?.name,
                        status: 'done',
                        // type: 'image/$fileType',
                      ),
                    ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: primaryPadding,
          child: Column(
            children: [
              Text(translate!.completeYourProfile, style: TitleHelper.h4),
              SizedBox(height: height * .02),
              Text(translate!.doNotWorryOnlyYouCanSeeYourPersonalData,
                  style: SubTitleHelper.h11, textAlign: TextAlign.center),
              SizedBox(height: height * .05),
              ProfilePictureAvatar(
                radius: 80,
                showEditButton: true,
                onPictureChange: (value) {
                  pickedImage = value;
                  log("pickedImage name : ${pickedImage?.name}");
                  log("pickedImage : ${pickedImage?.name.split(".").last}");
                  log("pickedImage : ${pickedImage?.path}");
                },
              ),
              SizedBox(height: height * .04),
              CustomTestField(
                controller: _nameController,
                label: translate!.name,
              ),
              CustomTestField(
                controller: _emailController,
                label: translate!.email,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: Container(
                      decoration: appBoxDecoration,
                      child: CustomCountryCodePicker(
                        onChanged: (value) {
                          _countryCodeController.text = value.code!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: width * .02),
                  Expanded(
                    flex: 85,
                    child: CustomTestField(
                      controller: _phoneNumberCodeController,
                      label: translate!.phoneNumber,
                    ),
                  ),
                ],
              ),
              Container(
                width: width,
                margin: EdgeInsets.symmetric(vertical: height * .01),
                decoration: appBoxDecoration,
                alignment: Alignment.centerLeft,
                child: CustomCountryCodePicker(
                  showOnlyCountryWhenClosed: true,
                  showCountryOnly: true,
                  // textStyle: _countryController.text != "Country"
                  //     ? null
                  //     : TextHelper.h10
                  //         .copyWith(color: AppFontsColors.lightGrey3),
                  onChanged: (value) {
                    setState(() {
                      _countryController.text = value.name!;
                    });
                  },
                ),
              ),
              CustomTestField(
                controller: _statusCodeController,
                label: translate!.status,
              ),
              BlocConsumer<CreateProfileCubit, CreateProfileState>(
                listener: (context, state) {
                  if (state is CreateProfileLoaded) {
                    // cupertinoNavigator(
                    //     type: NavigatorType.PUSHREMOVEUNTIL,
                    //     screenName: Dashboard());
                    context
                        .read<CreateProfileCubit>()
                        .emit(CreateProfileInitial());
                  } else if (state is CreateProfileError) {
                    showSnackBar(title: state.errorMsg);
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    label: translate.completeProfile,
                    isLoading: state is CreateProfileLoading,
                    onPressed: submitForm,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
