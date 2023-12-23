part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchModel searchModel;
  SearchLoaded({required this.searchModel});
}

class SearchError extends SearchState {
  final String errorMsg;
  SearchError({required this.errorMsg});
}
