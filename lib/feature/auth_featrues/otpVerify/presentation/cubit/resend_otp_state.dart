part of 'resend_otp_cubit.dart';

@immutable
abstract class ResendOtpState {}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpLoaded extends ResendOtpState {
  final SignUpModel signUpModel;
  ResendOtpLoaded({required this.signUpModel});
}

class ResendOtpError extends ResendOtpState {
  final String errorMsg;
  ResendOtpError({required this.errorMsg});
}
