part of 'personal_portfolio_cubit.dart';

@immutable
abstract class PersonalPortfolioState {}

class PersonalPortfolioInitial extends PersonalPortfolioState {}

class PersonalPortfolioLoading extends PersonalPortfolioState {}

class PersonalPortfolioLoaded extends PersonalPortfolioState {
  final PersonalDetailsModel personalDetailsModel;
  PersonalPortfolioLoaded({required this.personalDetailsModel});
}

class PersonalPortfolioError extends PersonalPortfolioState {
  final String errorMsg;
  PersonalPortfolioError({required this.errorMsg});
}
