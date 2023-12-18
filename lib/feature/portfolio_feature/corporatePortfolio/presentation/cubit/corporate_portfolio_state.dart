part of 'corporate_portfolio_cubit.dart';

@immutable
abstract class CorporatePortfolioState {}

class CorporatePortfolioInitial extends CorporatePortfolioState {}

class CorporatePortfolioLoading extends CorporatePortfolioState {}

class CorporatePortfolioLoaded extends CorporatePortfolioState {
  final CorporateDetailsModel academicDetailsModel;
  CorporatePortfolioLoaded({required this.academicDetailsModel});
}

class CorporatePortfolioError extends CorporatePortfolioState {
  final String errorMsg;
  CorporatePortfolioError({required this.errorMsg});
}
