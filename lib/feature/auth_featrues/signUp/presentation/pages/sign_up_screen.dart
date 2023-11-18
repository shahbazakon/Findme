import 'dart:developer';

import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_checkbox.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/pages/sign_in_screen.dart';
import 'package:find_me/feature/auth_featrues/signUp/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isRememberMe = false;
  Map? requestBody;

  @override
  void initState() {
    super.initState();
  }

  void apiCall() {
    requestBody = {
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "cf_password": _confirmPasswordController.text,
      "ipDetail": {
        "country_code": "PK",
        "country_name": "Pakistan",
        "city": null,
        "postal": null,
        "latitude": 30,
        "longitude": 70,
        "IPv4": "39.63.50.22",
        "state": null
      }
    };
    context.read<SignUpCubit>().getSignUpData(requestBody: requestBody!);
  }

  // call on Signup
  Future<void> onSignUpSuccess() async {
    if (isRememberMe) {
      await sharedPreferences!
          .setString(LocaleStorageKey.userEmail, _emailController.text);
      await sharedPreferences!
          .setString(LocaleStorageKey.userPassword, _passwordController.text);
    }
    cupertinoNavigator(
        type: NavigatorType.PUSHREMOVEUNTIL, screenName: const SignInScreen());
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
                translate!.signUp,
                style: TitleHelper.h1,
              ),
              SizedBox(height: height * .02),
              Text(
                translate!.hiWelcomeBackYouWereBeenMissed,
                style: SubTitleHelper.h12,
              ),
              SizedBox(height: height * .06),
              CustomTestField(
                  controller: _nameController, label: translate!.name),
              CustomTestField(
                  controller: _emailController, label: translate!.email),
              CustomTestField(
                  controller: _passwordController,
                  label: translate!.password,
                  isObscureButton: true),
              CustomTestField(
                  controller: _confirmPasswordController,
                  label: translate!.confirmPassword,
                  isObscureButton: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomCheckBox(onChanged: (value) {
                        isRememberMe = value;
                        log(" value: $value");
                      }),
                      Text(translate!.rememberMe),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * .06),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpLoaded) {
                    showSnackBar(title: state.signUpModel.message.toString());
                    onSignUpSuccess();
                  } else if (state is SignUpError) {
                    showSnackBar(title: state.errorMsg);
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    label: translate!.signUp,
                    isLoading: state is SignUpLoading,
                    onPressed: apiCall,
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
