part of 'home__cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeModel homeModel;
  HomeLoaded({required this.homeModel});
}

class HomeError extends HomeState {
  final String errorMsg;
  HomeError({required this.errorMsg});
}
