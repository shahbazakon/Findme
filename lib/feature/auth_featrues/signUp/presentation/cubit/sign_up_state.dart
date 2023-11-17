part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignupInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final SignUpModel signUpModel;
  SignUpLoaded(this.signUpModel);
}

class SignUpError extends SignUpState {
  final String errorMsg;
  SignUpError(this.errorMsg);
}
