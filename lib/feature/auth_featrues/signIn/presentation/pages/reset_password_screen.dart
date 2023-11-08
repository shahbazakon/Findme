import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  translate!.resetPassword,
                  style: TitleHelper.h1,
                ),
              ),
              Text(
                translate!.yourNewPasswordShouldBeDifferentFromOlderPasswords,
                style: SubTitleHelper.h12,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * .06),
              CustomTestField(
                controller: _passwordController,
                label: translate!.password,
                isObscureButton: true,
              ),
              CustomTestField(
                controller: _confirmPasswordController,
                label: translate!.confirmPassword,
                isObscureButton: true,
              ),
              SizedBox(height: height * .06),
              AppButton(
                label: translate!.reset,
                onPressed: () {
                  cupertinoNavigator(
                      type: NavigatorType.PUSHREMOVEUNTIL,
                      screenName: SuccessScreen(
                        subTitle: translate!.yourPasswordResetIsSuccessful,
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
