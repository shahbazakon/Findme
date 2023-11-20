import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/success_screen.dart';
import 'package:find_me/feature/auth_featrues/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.id});
  final String id;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordError) {
                    showSnackBar(title: state.errorMsg);
                  } else if (state is ResetPasswordLoaded) {
                    showSnackBar(
                        title: state.resetPasswordModel.message.toString());
                    cupertinoNavigator(
                        type: NavigatorType.PUSHREMOVEUNTIL,
                        screenName: SuccessScreen(
                          subTitle: translate!.yourPasswordResetIsSuccessful,
                          isHomeButtonVisible: true,
                        ));
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    label: translate!.reset,
                    onPressed: () {
                      context.read<ResetPasswordCubit>().resetPassword(
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text,
                          id: widget.id);
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
