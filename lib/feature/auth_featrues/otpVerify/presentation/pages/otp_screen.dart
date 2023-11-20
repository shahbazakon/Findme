import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/customCountDown.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/presentation/cubit/otp_verify_cubit.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/presentation/cubit/resend_otp_cubit.dart';
import 'package:find_me/feature/auth_featrues/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../../core/constants/theme_constants.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/widget/button/app_Button_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.userEmail, required this.id});

  final String userEmail;
  final String id;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool startCountdown = true;
  int? otpPin;
  int otpLength = 4;

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
                length: otpLength,
                width: width * .6,
                fieldWidth: 50,
                style: TitleHelper.h8,
                fieldStyle: FieldStyle.box,
                keyboardType: TextInputType.number,
                otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: AppColors.lightGrey2,
                  backgroundColor: AppColors.lightGrey1,
                ),
                onChanged: (pin) {},
                onCompleted: (pin) {
                  otpPin = int.parse(pin);
                },
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
                      .read<ForgotPasswordCubit>()
                      .getForgotPasswordData(email: widget.userEmail);
                  setState(() {
                    startCountdown = true;
                  });
                },
                child: BlocConsumer<ResendOtpCubit, ResendOtpState>(
                  listener: (context, state) {
                    if (state is ResendOtpLoaded) {
                      showSnackBar(title: state.signUpModel.message.toString());
                    } else if (state is ResendOtpError) {
                      showSnackBar(title: state.errorMsg);
                    }
                  },
                  builder: (context, state) {
                    return startCountdown
                        ? CountdownTimer(
                            onEnd: () {
                              setState(() {
                                startCountdown = false;
                              });
                            },
                          )
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
              BlocConsumer<OtpVerifyCubit, OtpVerifyState>(
                listener: (context, state) {
                  if (state is OtpVerifyLoaded) {
                    showSnackBar(
                        title: state.otpVerifyModel.message.toString());
                    cupertinoNavigator(
                        type: NavigatorType.PUSHREPLACE,
                        screenName: ResetPasswordScreen(
                          id: widget.id,
                        ));
                  } else if (state is OtpVerifyError) {
                    showSnackBar(title: state.errorMsg);
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    label: translate!.verify,
                    isLoading: state is OtpVerifyLoading,
                    onPressed: () {
                      if (otpPin.toString().length == otpLength) {
                        context
                            .read<OtpVerifyCubit>()
                            .verifyOtp(otp: otpPin!, id: widget.id);
                      }

                      // cupertinoNavigator(
                      //     type: NavigatorType.PUSHREPLACE,
                      //     screenName: SuccessScreen(
                      //       subTitleWidget: RichText(
                      //           textAlign: TextAlign.center,
                      //           text: TextSpan(
                      //               text: translate!
                      //                   .yourSignUpWasVerifiedSuccessfullyPlease,
                      //               style: SubTitleHelper.h11,
                      //               children: [
                      //                 TextSpan(
                      //                   text: translate!.signIn,
                      //                   style: SubTitleHelper.h11.copyWith(
                      //                       decoration: TextDecoration.underline),
                      //                   recognizer: TapGestureRecognizer()
                      //                     ..onTap = () {
                      //                       cupertinoNavigator(
                      //                           screenName: const SignInScreen());
                      //                     },
                      //                 ),
                      //                 TextSpan(
                      //                     text: translate!.toContinue,
                      //                     style: SubTitleHelper.h11)
                      //               ])),
                      //     ));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
