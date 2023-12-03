part of 'create_profile_cubit.dart';

@immutable
abstract class CreateProfileState {}

class CreateProfileInitial extends CreateProfileState {}

class CreateProfileLoading extends CreateProfileState {}

class CreateProfileLoaded extends CreateProfileState {
  final ProfileModel profileModel;
  CreateProfileLoaded({required this.profileModel});
}

class CreateProfileError extends CreateProfileState {
  final String errorMsg;
  CreateProfileError({required this.errorMsg});
}
