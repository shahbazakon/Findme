import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var translate = AppLocalizations.of(context);
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
                  translate!.forgotPassword,
                  style: TitleHelper.h1,
                ),
              ),
              Text(
                translate!.enterYourEmailAddressToChangeYourPassword,
                style: SubTitleHelper.h12,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * .04),
              CustomTestField(controller: _emailController, label: "Email"),
              SizedBox(height: height * .04),
              AppButton(
                label: translate!.send,
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
