part of 'matrimonial_portfolio_cubit.dart';

@immutable
abstract class MatrimonialPortfolioState {}

class MatrimonialPortfolioInitial extends MatrimonialPortfolioState {}

class MatrimonialPortfolioLoading extends MatrimonialPortfolioState {}

class MatrimonialPortfolioLoaded extends MatrimonialPortfolioState {
  final MatrimonialDetailsModel academicDetailsModel;
  MatrimonialPortfolioLoaded({required this.academicDetailsModel});
}

class MatrimonialPortfolioError extends MatrimonialPortfolioState {
  final String errorMsg;
  MatrimonialPortfolioError({required this.errorMsg});
}
