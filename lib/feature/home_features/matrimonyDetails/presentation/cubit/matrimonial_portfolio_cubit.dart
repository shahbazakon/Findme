import 'package:bloc/bloc.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/data/models/matrimonial_%20Model.dart';
import 'package:meta/meta.dart';

part 'matrimonial_portfolio_state.dart';

class MatrimonialPortfolioCubit extends Cubit<MatrimonialPortfolioState> {
  MatrimonialPortfolioCubit() : super(MatrimonialPortfolioInitial());
}
