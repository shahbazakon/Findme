import 'package:find_me/core/helper/navigators.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/utils/utils_methods.dart';
import '../../../../../core/widget/Input Field/custom_test_field.dart';
import '../../../../../core/widget/button/app_Button_widget.dart';
import 'reset_password_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
                    EdgeInsets.only(top: height * .05, bottom: height * .02),
                child: Text(
                  "Forgot Password",
                  style: TitleHelper.h1,
                ),
              ),
              Text(
                "Enter your email address to change your password",
                style: SubTitleHelper.h12,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * .04),
              CustomTestField(controller: _emailController, label: "Email"),
              SizedBox(height: height * .04),
              AppButton(
                label: "Send",
                onPressed: () {
                  cupertinoNavigator(
                      type: NavigatorType.PUSHREPLACE,
                      screenName: const ResetPasswordScreen());
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
