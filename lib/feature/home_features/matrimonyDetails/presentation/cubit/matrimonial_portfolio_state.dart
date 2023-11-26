part of 'matrimonial_portfolio_cubit.dart';

@immutable
abstract class MatrimonialPortfolioState {}

class MatrimonialPortfolioInitial extends MatrimonialPortfolioState {}

class MatrimonialPortfolioLoading extends MatrimonialPortfolioState {}

class MatrimonialPortfolioLoaded extends MatrimonialPortfolioState {
  final MatrimonialModel matrimonialModel;
  MatrimonialPortfolioLoaded(this.matrimonialModel);
}

class MatrimonialPortfolioError extends MatrimonialPortfolioState {
  final String errorMsg;
  MatrimonialPortfolioError(this.errorMsg);
}
