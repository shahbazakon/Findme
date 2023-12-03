import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/presentation/cubit/otp_verify_cubit.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/presentation/cubit/resend_otp_cubit.dart';
import 'package:find_me/feature/auth_featrues/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/forgot_password_cubit.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/sign_in_cubit.dart';
import 'package:find_me/feature/auth_featrues/signUp/presentation/cubit/sign_up_cubit.dart';
import 'package:find_me/feature/home_features/academicDetails/presentation/cubit/academic_details_cubit.dart';
import 'package:find_me/feature/home_features/businessDetails/presentation/cubit/business_details_cubit.dart';
import 'package:find_me/feature/home_features/corporateDetails/presentation/cubit/corporate_details_cubit.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/presentation/cubit/matrimonial_portfolio_cubit.dart';
import 'package:find_me/feature/home_features/personalDetails/presentation/cubit/presontation_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> providers = [
  BlocProvider<SignInCubit>(
    create: (BuildContext context) => locator<SignInCubit>(),
  ),
  BlocProvider<SignUpCubit>(
    create: (context) => locator<SignUpCubit>(),
  ),
  BlocProvider<ResendOtpCubit>(
    create: (context) => locator<ResendOtpCubit>(),
  ),
  BlocProvider<ForgotPasswordCubit>(
    create: (BuildContext context) => locator<ForgotPasswordCubit>(),
  ),
  BlocProvider<OtpVerifyCubit>(
    create: (BuildContext context) => locator<OtpVerifyCubit>(),
  ),
  BlocProvider<ResetPasswordCubit>(
    create: (BuildContext context) => locator<ResetPasswordCubit>(),
  ),
  BlocProvider<MatrimonialPortfolioCubit>(
    create: (BuildContext context) => locator<MatrimonialPortfolioCubit>(),
  ),
  BlocProvider<AcademicDetailsCubit>(
    create: (BuildContext context) => locator<AcademicDetailsCubit>(),
  ),
  BlocProvider<BusinessDetailsCubit>(
    create: (BuildContext context) => locator<BusinessDetailsCubit>(),
  ),
  BlocProvider<CorporateDetailsCubit>(
    create: (BuildContext context) => locator<CorporateDetailsCubit>(),
  ),
  BlocProvider<PersonalDetailsCubit>(
    create: (BuildContext context) => locator<PersonalDetailsCubit>(),
  ),
];
