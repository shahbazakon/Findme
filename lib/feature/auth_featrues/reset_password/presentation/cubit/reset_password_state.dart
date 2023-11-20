part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordLoaded extends ResetPasswordState {
  final ResetPasswordModel resetPasswordModel;
  ResetPasswordLoaded({required this.resetPasswordModel});
}

class ResetPasswordError extends ResetPasswordState {
  final String errorMsg;
  ResetPasswordError({required this.errorMsg});
}
