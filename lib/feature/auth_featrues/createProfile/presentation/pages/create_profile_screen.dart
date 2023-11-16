import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/county_code_picker.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/profile_picture_avatar.dart';
import 'package:find_me/feature/dashboard/presentation/pages/dashboard_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

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
              const ProfilePictureAvatar(
                radius: 80,
                showEditButton: true,
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
              AppButton(
                label: translate!.completeProfile,
                onPressed: () {
                  cupertinoNavigator(
                      type: NavigatorType.PUSHREMOVEUNTIL,
                      screenName: Dashboard());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
