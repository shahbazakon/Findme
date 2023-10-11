import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils_methods.dart';
import '../../../../core/widget/Text Field/custom_test_field.dart';
import '../../../../core/widget/button/app_Button_widget.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: primaryPadding,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height * .06, bottom: height * .02),
                  child: Text(
                    "Sign In",
                    style: TitleHelper.h1,
                  ),
                ),
                Text(
                  "Hi! Welcome back, you’ve been missed",
                  style: TextHelper.h12,
                ),
                SizedBox(height: height * .04),
                CustomTestField(controller: _emailController, label: "Email"),
                SizedBox(height: height * .02),
                CustomTestField(
                    controller: _passwordController,
                    label: "Password",
                    isObscureButton: true),
                SizedBox(height: height * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isRememberMe,
                          onChanged: (value) {
                            setState(() {
                              isRememberMe = !isRememberMe;
                            });
                          },
                        ),
                        const Text("Remember me"),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          cupertinoNavigator(
                              screenName: const ForgetPasswordScreen());
                        },
                        child: const Text("Forgot Password?"))
                  ],
                ),
                SizedBox(height: height * .06),
                AppButton(
                  label: "Sign In",
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
                              text: "Don’t have an account?",
                              style: SubTitleHelper.h9,
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: SubTitleHelper.h9
                                      .copyWith(color: AppColors.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // TODO: Navigate to login Screen
                                    },
                                )
                              ])
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
