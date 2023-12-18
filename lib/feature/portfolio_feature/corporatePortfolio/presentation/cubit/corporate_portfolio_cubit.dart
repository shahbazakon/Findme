import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/portfolio_feature/corporatePortfolio/data/datasource/corporate_remote_datasource.dart';
import 'package:find_me/feature/portfolio_feature/corporatePortfolio/data/models/corporate_details+model.dart';
import 'package:meta/meta.dart';

part 'corporate_portfolio_state.dart';

class CorporatePortfolioCubit extends Cubit<CorporatePortfolioState> {
  CorporatePortfolioCubit() : super(CorporatePortfolioInitial());

  fetchCorporatePortfolioDetails({required String userID}) async {
    try {
      emit(CorporatePortfolioLoading());
      CorporateDetailsModel result = await CorporateRemoteDataSource()
          .fetchCorporateDetails(cardID: userID);
      emit(CorporatePortfolioLoaded(academicDetailsModel: result));
    } on DioException catch (error) {
      emit(CorporatePortfolioError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
