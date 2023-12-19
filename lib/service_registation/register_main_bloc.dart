import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/Profile/presentation/cubit/profile_details_cubit.dart';
import 'package:find_me/feature/auth_featrues/createProfile/presentation/cubit/create_profile_cubit.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/presentation/cubit/otp_verify_cubit.dart';
import 'package:find_me/feature/auth_featrues/otpVerify/presentation/cubit/resend_otp_cubit.dart';
import 'package:find_me/feature/auth_featrues/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/forgot_password_cubit.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/sign_in_cubit.dart';
import 'package:find_me/feature/auth_featrues/signUp/presentation/cubit/sign_up_cubit.dart';
import 'package:find_me/feature/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:find_me/feature/home_features/academicDetails/presentation/cubit/academic_details_cubit.dart';
import 'package:find_me/feature/home_features/businessDetails/presentation/cubit/business_details_cubit.dart';
import 'package:find_me/feature/home_features/corporateDetails/presentation/cubit/corporate_details_cubit.dart';
import 'package:find_me/feature/home_features/home/presentation/cubit/home__cubit.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/presentation/cubit/matrimonial_portfolio_cubit.dart';
import 'package:find_me/feature/home_features/personalDetails/presentation/cubit/presontation_details_cubit.dart';
import 'package:find_me/feature/notifications/presentation/cubit/notification_cubit.dart';
import 'package:find_me/feature/portfolio_feature/academicPortfolio/presentation/cubit/academic_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/businessPortfolio/presentation/cubit/business_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/corporatePortfolio/presentation/cubit/corporate_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/matrimonyPortfolio/presentation/cubit/matrimonial_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/cubit/personal_portfolio_cubit.dart';
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
  BlocProvider<MatrimonialDetailsPortfolioCubit>(
    create: (BuildContext context) =>
        locator<MatrimonialDetailsPortfolioCubit>(),
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
  BlocProvider<CreateProfileCubit>(
    create: (BuildContext context) => locator<CreateProfileCubit>(),
  ),
  BlocProvider<HomeCubit>(
    create: (BuildContext context) => locator<HomeCubit>(),
  ),
  BlocProvider<ContactsCubit>(
    create: (BuildContext context) => locator<ContactsCubit>(),
  ),
  BlocProvider<AcademicPortfolioCubit>(
    create: (BuildContext context) => locator<AcademicPortfolioCubit>(),
  ),
  BlocProvider<ProfileDetailsCubit>(
    create: (BuildContext context) => locator<ProfileDetailsCubit>(),
  ),
  BlocProvider<NotificationCubit>(
    create: (BuildContext context) => locator<NotificationCubit>(),
  ),
  BlocProvider<PersonalPortfolioCubit>(
    create: (BuildContext context) => locator<PersonalPortfolioCubit>(),
  ),
  BlocProvider<BusinessPortfolioCubit>(
    create: (BuildContext context) => locator<BusinessPortfolioCubit>(),
  ),
  BlocProvider<CorporatePortfolioCubit>(
    create: (BuildContext context) => locator<CorporatePortfolioCubit>(),
  ),
  BlocProvider<MatrimonialDetailsPortfolioCubit>(
    create: (BuildContext context) =>
        locator<MatrimonialDetailsPortfolioCubit>(),
  ),
  BlocProvider<MatrimonialPortfolioCubit>(
    create: (BuildContext context) => locator<MatrimonialPortfolioCubit>(),
  ),
];
