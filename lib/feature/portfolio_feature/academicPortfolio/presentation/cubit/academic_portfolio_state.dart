part of 'academic_portfolio_cubit.dart';

@immutable
abstract class AcademicPortfolioState {}

class AcademicPortfolioInitial extends AcademicPortfolioState {}

class AcademicPortfolioLoading extends AcademicPortfolioState {}

class AcademicPortfolioLoaded extends AcademicPortfolioState {
  final PortfolioDetailsModel portfolioDetailsModel;
  AcademicPortfolioLoaded({required this.portfolioDetailsModel});
}

class AcademicPortfolioError extends AcademicPortfolioState {
  final String errorMsg;
  AcademicPortfolioError({required this.errorMsg});
}
