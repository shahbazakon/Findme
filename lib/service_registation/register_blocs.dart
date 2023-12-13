import 'package:find_me/core/utils/utils_methods.dart';
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
import 'package:find_me/feature/portfolio_feature/academicPortfolio/presentation/cubit/academic_portfolio_cubit.dart';

class RegisterBlocs {
  RegisterBlocs() {
    locator.registerFactory(() => SignInCubit());
    locator.registerFactory(() => SignUpCubit());
    locator.registerFactory(() => ForgotPasswordCubit());
    locator.registerFactory(() => ResendOtpCubit());
    locator.registerFactory(() => OtpVerifyCubit());
    locator.registerFactory(() => ResetPasswordCubit());
    locator.registerFactory(() => MatrimonialPortfolioCubit());
    locator.registerFactory(() => AcademicDetailsCubit());
    locator.registerFactory(() => BusinessDetailsCubit());
    locator.registerFactory(() => CorporateDetailsCubit());
    locator.registerFactory(() => PersonalDetailsCubit());
    locator.registerFactory(() => CreateProfileCubit());
    locator.registerFactory(() => HomeCubit());
    locator.registerFactory(() => ContactsCubit());
    locator.registerFactory(() => AcademicPortfolioCubit());
  }
}
