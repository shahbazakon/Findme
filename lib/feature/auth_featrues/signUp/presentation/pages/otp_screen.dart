import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/core/widget/success_screen.dart';
import 'package:find_me/feature/auth_featrues/signUp/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../../core/constants/theme_constants.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/widget/button/app_Button_widget.dart';
import '../../../signIn/presentation/pages/sign_in_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, this.userEmail, required this.requestBody});

  final String? userEmail;
  final Map requestBody;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final OtpFieldController _otpController = OtpFieldController();

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
                translate!.verifyCode,
                style: TitleHelper.h1,
              ),
              SizedBox(height: height * .0),
              Text(
                translate!.pleaseEnterTheVerificationCodeWeSentToYourEmail,
                style: SubTitleHelper.h12,
              ),
              SizedBox(height: height * .02),
              Text(
                widget.userEmail ?? "",
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
                translate!.didNotReceiveCode,
                style: SubTitleHelper.h11,
              ),
              SizedBox(height: height * .02),
              InkWell(
                onTap: () {
                  context
                      .read<SignUpCubit>()
                      .getSignUpData(requestBody: widget.requestBody);
                },
                child: BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return (state is SignUpLoading)
                        ? Loading()
                        : Text(
                            translate!.resendCode,
                            style: TextHelper.h10.copyWith(
                                color: AppColors.primary,
                                decoration: TextDecoration.underline),
                          );
                  },
                ),
              ),
              SizedBox(height: height * .04),
              AppButton(
                label: translate!.verify,
                onPressed: () {
                  cupertinoNavigator(
                      type: NavigatorType.PUSHREPLACE,
                      screenName: SuccessScreen(
                        subTitleWidget: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: translate!
                                    .yourSignUpWasVerifiedSuccessfullyPlease,
                                style: SubTitleHelper.h11,
                                children: [
                                  TextSpan(
                                    text: translate!.signIn,
                                    style: SubTitleHelper.h11.copyWith(
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        cupertinoNavigator(
                                            screenName: const SignInScreen());
                                      },
                                  ),
                                  TextSpan(
                                      text: translate!.toContinue,
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
