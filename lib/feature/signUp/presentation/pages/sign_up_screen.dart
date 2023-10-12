import 'dart:developer';

import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/signIn/presentation/pages/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/navigators.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/Text Field/custom_checkbox.dart';
import '../../../../core/widget/Text Field/custom_test_field.dart';
import '../../../../core/widget/button/app_Button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: primaryPadding,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * .06, bottom: height * .02),
                child: Text(
                  "Sign Up",
                  style: TitleHelper.h1,
                ),
              ),
              Text(
                "Hi! Welcome back, you’ve been missed",
                style: TextHelper.h12,
              ),
              SizedBox(height: height * .06),
              CustomTestField(controller: _nameController, label: "Name"),
              SizedBox(height: height * .02),
              CustomTestField(controller: _emailController, label: "Email"),
              SizedBox(height: height * .02),
              CustomTestField(
                  controller: _passwordController,
                  label: "Password",
                  isObscureButton: true),
              SizedBox(height: height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomCheckBox(onChanged: (value) {
                        isRememberMe = value;
                        log(" value: $value");
                      }),
                      const Text("Remember me"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * .06),
              AppButton(
                label: "Sign Up",
                onPressed: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "or\n",
                      style: SubTitleHelper.h8
                          .copyWith(color: AppFontsColors.lightGrey3),
                      children: [
                        TextSpan(
                            text: "Already have account?",
                            style: SubTitleHelper.h9,
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: SubTitleHelper.h9
                                    .copyWith(color: AppColors.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    cupertinoNavigator(
                                        screenName: const SignInScreen());
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
