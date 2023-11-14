import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/forgot_password_cubit.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/cubit/sign_in_cubit.dart';

class RegisterBlocs {
  RegisterBlocs() {
    locator.registerFactory(() => SignInCubit());
    locator.registerFactory(() => ForgotPasswordCubit());
  }
}
