part of 'personal_portfolio_cubit.dart';

@immutable
abstract class PersonalPortfolioState {}

class PersonalPortfolioInitial extends PersonalPortfolioState {}

class PersonalPortfolioLoading extends PersonalPortfolioState {}

class PersonalPortfolioLoaded extends PersonalPortfolioState {
  final PortfolioGetModel portfolioModel;
  PersonalPortfolioLoaded({required this.portfolioModel});
}

class PersonalPortfolioError extends PersonalPortfolioState {
  final String errorMsg;
  PersonalPortfolioError({required this.errorMsg});
}
