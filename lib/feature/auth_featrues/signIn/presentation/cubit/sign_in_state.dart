part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInLoaded extends SignInState {
  final SignInModel signInModel;
  SignInLoaded(this.signInModel);
}

class SignInError extends SignInState {
  final String errorMsg;
  SignInError(this.errorMsg);
}
