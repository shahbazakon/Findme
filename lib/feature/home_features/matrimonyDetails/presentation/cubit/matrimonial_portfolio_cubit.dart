import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/data/datasSource/matrimonial_details_remote_datasource.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/data/models/matrimonial_%20Model.dart';
import 'package:meta/meta.dart';

part 'matrimonial_portfolio_state.dart';

class MatrimonialPortfolioCubit extends Cubit<MatrimonialPortfolioState> {
  MatrimonialPortfolioCubit() : super(MatrimonialPortfolioInitial());

  createMatrimonialPortfolio({required MatrimonialModel data}) async {
    try {
      emit(MatrimonialPortfolioLoading());
      MatrimonialModel result = await MatrimonialDetailsRemoteDataSource()
          .createPortfolio(data: data);
      emit(MatrimonialPortfolioLoaded(matrimonialModel: result));
    } on DioException catch (error) {
      emit(MatrimonialPortfolioError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
