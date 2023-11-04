import 'dart:developer';

import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_checkbox.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/feature/auth_featrues/createProfile/presentation/pages/create_profile_screen.dart';
import 'package:find_me/feature/auth_featrues/signUp/presentation/pages/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/local_storege_key.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRememberMe = false;

  @override
  void initState() {
    setValue();
    super.initState();
  }

  //save Local Value
  void setValue() async {
    await sharedPreferences?.setBool(
        LocalStorageKey.isOnBoardingCompleted, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: primaryPadding,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * .06, bottom: height * .02),
                child: Text(
                  translate!.signIn,
                  style: TitleHelper.h1,
                ),
              ),
              Text(
                translate!.hiWelcomeBackYouWereBeenMissed,
                style: TextHelper.h12,
              ),
              SizedBox(height: height * .04),
              CustomTestField(controller: _emailController, label: "Email"),
              CustomTestField(
                  controller: _passwordController,
                  label: translate!.password,
                  isObscureButton: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  InkWell(
                      onTap: () {
                        cupertinoNavigator(
                            screenName: const ForgetPasswordScreen());
                      },
                      child: Text(translate!.forgotPassword))
                ],
              ),
              SizedBox(height: height * .06),
              AppButton(
                label: translate!.signIn,
                onPressed: () {
                  cupertinoNavigator(
                      type: NavigatorType.PUSHREMOVEUNTIL,
                      screenName: const CreateProfile());
                },
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "${translate!.or}\n",
                      style: SubTitleHelper.h8
                          .copyWith(color: AppFontsColors.lightGrey3),
                      children: [
                        TextSpan(
                            text: translate!.doNotHaveAnAccount,
                            style: SubTitleHelper.h10,
                            children: [
                              TextSpan(
                                text: translate!.signUp,
                                style: SubTitleHelper.h10
                                    .copyWith(color: AppColors.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    cupertinoNavigator(
                                        screenName: const SignUpScreen());
                                  },
                              )
                            ])
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
