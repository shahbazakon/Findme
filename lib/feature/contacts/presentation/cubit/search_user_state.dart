part of 'search_user_cubit.dart';

@immutable
abstract class SearchUserState {}

class SearchUserInitial extends SearchUserState {}

class SearchUserLoading extends SearchUserState {}

class SearchUserLoaded extends SearchUserState {
  final SearchUserModel searchUserModel;
  SearchUserLoaded({required this.searchUserModel});
}

class SearchUserError extends SearchUserState {
  final String errorMsg;
  SearchUserError({required this.errorMsg});
}
