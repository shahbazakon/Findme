part of 'business_portfolio_cubit.dart';

@immutable
abstract class BusinessPortfolioState {}

class BusinessPortfolioInitial extends BusinessPortfolioState {}

class BusinessPortfolioLoading extends BusinessPortfolioState {}

class BusinessPortfolioLoaded extends BusinessPortfolioState {
  final BusinessDetailsModel academicDetailsModel;
  BusinessPortfolioLoaded({required this.academicDetailsModel});
}

class BusinessPortfolioError extends BusinessPortfolioState {
  final String errorMsg;
  BusinessPortfolioError({required this.errorMsg});
}
