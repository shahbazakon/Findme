part of 'otp_verify_cubit.dart';

@immutable
abstract class OtpVerifyState {}

class OtpVerifyInitial extends OtpVerifyState {}

class OtpVerifyLoading extends OtpVerifyState {}

class OtpVerifyLoaded extends OtpVerifyState {
  final OtpVerifyModel otpVerifyModel;
  OtpVerifyLoaded({required this.otpVerifyModel});
}

class OtpVerifyError extends OtpVerifyState {
  final String errorMsg;
  OtpVerifyError({required this.errorMsg});
}
