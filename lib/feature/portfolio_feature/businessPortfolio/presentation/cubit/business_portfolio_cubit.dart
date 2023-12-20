import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/portfolio_feature/businessPortfolio/data/datasource/business_remote_datasource.dart';
import 'package:find_me/feature/portfolio_feature/businessPortfolio/data/models/business_portfolio_model.dart';
import 'package:meta/meta.dart';

part 'business_portfolio_state.dart';

class BusinessPortfolioCubit extends Cubit<BusinessPortfolioState> {
  BusinessPortfolioCubit() : super(BusinessPortfolioInitial());

  fetchBusinessPortfolioDetails({required String cardID}) async {
    try {
      emit(BusinessPortfolioLoading());
      BusinessPortfolioModel result =
          await BusinessRemoteDataSource().fetchBusinessDetails(cardID: cardID);
      emit(BusinessPortfolioLoaded(businessPortfolioModel: result));
    } on DioException catch (error) {
      emit(BusinessPortfolioError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
