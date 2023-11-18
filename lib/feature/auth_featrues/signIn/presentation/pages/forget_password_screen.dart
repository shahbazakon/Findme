import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/presentation/pages/otp_screen.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
              CustomTestField(
                  controller: _emailController, label: translate!.email),
              SizedBox(height: height * .04),
              BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                listener: (context, state) {
                  if (state is ForgotPasswordLoaded) {
                    if (state.forgotPasswordModel.success ?? false) {
                      showSnackBar(
                          title: state.forgotPasswordModel.message ?? '');
                      cupertinoNavigator(
                        type: NavigatorType.PUSHREPLACE,
                        screenName: OTPScreen(
                          userEmail: _emailController.text,
                        ),
                      );
                    } else {
                      showSnackBar(
                          title: state.forgotPasswordModel.message ?? '');
                    }
                  } else if (state is ForgotPasswordError) {
                    showSnackBar(title: state.errorMsg);
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    label: translate!.send,
                    isLoading: state is ForgotPasswordLoading,
                    onPressed: () {
                      context
                          .read<ForgotPasswordCubit>()
                          .getForgotPasswordData(email: _emailController.text);
                    },
                  );
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
