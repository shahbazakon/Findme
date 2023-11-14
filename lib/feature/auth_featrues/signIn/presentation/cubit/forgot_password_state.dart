part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordError extends ForgotPasswordState {
  final String errorMsg;
  ForgotPasswordError(this.errorMsg);
}

class ForgotPasswordLoaded extends ForgotPasswordState {
  final ForgotPasswordModel forgotPasswordModel;
  ForgotPasswordLoaded(this.forgotPasswordModel);
}
