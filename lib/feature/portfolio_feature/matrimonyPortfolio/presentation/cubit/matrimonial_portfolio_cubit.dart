import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/portfolio_feature/matrimonyPortfolio/data/datasource/matrimonial_remote_datasource.dart';
import 'package:find_me/feature/portfolio_feature/matrimonyPortfolio/data/models/matrimonial_details_models.dart';
import 'package:meta/meta.dart';

part 'matrimonial_portfolio_state.dart';

class MatrimonialPortfolioCubit extends Cubit<MatrimonialPortfolioState> {
  MatrimonialPortfolioCubit() : super(MatrimonialPortfolioInitial());

  fetchMatrimonialPortfolioDetails({required String userID}) async {
    try {
      emit(MatrimonialPortfolioLoading());
      MatrimonialDetailsModel result = await MatrimonialRemoteDataSource()
          .fetchMatrimonialDetails(cardID: userID);
      emit(MatrimonialPortfolioLoaded(academicDetailsModel: result));
    } on DioException catch (error) {
      emit(MatrimonialPortfolioError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
