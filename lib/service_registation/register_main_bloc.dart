import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/forgot_password_cubit.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/sign_in_cubit.dart';
import 'package:find_me/feature/auth_featrues/signUp/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<SignInCubit>(
    create: (BuildContext context) => locator<SignInCubit>(),
  ),
  BlocProvider<SignUpCubit>(
    create: (context) => locator<SignUpCubit>(),
  ),
  BlocProvider<ForgotPasswordCubit>(
    create: (BuildContext context) => locator<ForgotPasswordCubit>(),
  ),
];
