import 'dart:developer';

import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_checkbox.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRememberMe = false;

  @override
  void initState() {
    super.initState();
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
              Text(
                translate!.signUp,
                style: TitleHelper.h1,
              ),
              SizedBox(height: height * .02),
              Text(
                translate!.hiWelcomeBackYouWereBeenMissed,
                style: SubTitleHelper.h12,
              ),
              SizedBox(height: height * .06),
              CustomTestField(
                  controller: _nameController, label: translate!.name),
              CustomTestField(
                  controller: _emailController, label: translate!.email),
              CustomTestField(
                  controller: _passwordController,
                  label: translate!.password,
                  isObscureButton: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomCheckBox(onChanged: (value) {
                        isRememberMe = value;
                        log(" value: $value");
                      }),
                      Text(translate!.rememberMe),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * .06),
              AppButton(
                label: translate!.signUp,
                onPressed: () {
                  cupertinoNavigator(screenName: const OTPScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
