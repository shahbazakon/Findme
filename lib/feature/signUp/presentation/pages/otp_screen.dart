import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/success_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../core/constants/common_ui.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/button/app_Button_widget.dart';
import '../../../signIn/presentation/pages/sign_in_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final OtpFieldController _otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: primaryPadding,
          child: Column(
            children: [
              Text(
                "Verify Code",
                style: TitleHelper.h1,
              ),
              SizedBox(height: height * .0),
              Text(
                "Please enter the verification code we sent to your email",
                style: SubTitleHelper.h12,
              ),
              SizedBox(height: height * .02),
              Text(
                "Example@email.com",
                style: SubTitleHelper.h12
                    .copyWith(color: AppFontsColors.lightGrey3),
              ),
              SizedBox(height: height * .06),
              OTPTextField(
                length: 4,
                width: width * .6,
                fieldWidth: 50,
                style: TitleHelper.h8,
                fieldStyle: FieldStyle.box,
                keyboardType: TextInputType.number,
                controller: _otpController,
                otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: AppColors.lightGrey2,
                  backgroundColor: AppColors.lightGrey1,
                ),
                onCompleted: (pin) {},
              ),
              SizedBox(height: height * .1),
              Text(
                "Did’t receive code?",
                style: SubTitleHelper.h11,
              ),
              SizedBox(height: height * .02),
              InkWell(
                onTap: () {},
                child: Text(
                  "Resend Code",
                  style: TextHelper.h10.copyWith(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: height * .04),
              AppButton(
                label: "Verify",
                onPressed: () {
                  cupertinoNavigator(
                      type: NavigatorType.PUSHREPLACE,
                      screenName: SuccessScreen(
                        subTitleWidget: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text:
                                    "Your sign up was verified successfully, Please ",
                                style: SubTitleHelper.h11,
                                children: [
                                  TextSpan(
                                    text: "sign in",
                                    style: SubTitleHelper.h11.copyWith(
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        cupertinoNavigator(
                                            screenName: const SignInScreen());
                                      },
                                  ),
                                  TextSpan(
                                      text: " to continue",
                                      style: SubTitleHelper.h11)
                                ])),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
