import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/widget/success_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/theme_contants.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/utils_methods.dart';
import '../../../../core/widget/Input Field/custom_test_field.dart';
import '../../../../core/widget/button/app_Button_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                  "Reset Password",
                  style: TitleHelper.h1,
                ),
              ),
              Text(
                "Your new password should be different from older passwords",
                style: SubTitleHelper.h12,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * .06),
              CustomTestField(
                controller: _passwordController,
                label: "Password",
                isObscureButton: true,
              ),
              CustomTestField(
                controller: _confirmPasswordController,
                label: "Confirm Password",
                isObscureButton: true,
              ),
              SizedBox(height: height * .06),
              AppButton(
                label: "Reset",
                onPressed: () {
                  cupertinoNavigator(
                      type: NavigatorType.PUSHREMOVEUNTIL,
                      screenName: const SuccessScreen(
                        subTitle: "Your Password reset is successful!",
                        isHomeButtonVisible: true,
                      ));
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
