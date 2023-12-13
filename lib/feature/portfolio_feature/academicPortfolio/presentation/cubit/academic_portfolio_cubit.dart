import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/protfolio_details_model.dart';
import 'package:meta/meta.dart';

part 'academic_portfolio_state.dart';

class AcademicPortfolioCubit extends Cubit<AcademicPortfolioState> {
  AcademicPortfolioCubit() : super(AcademicPortfolioInitial());

  fetchAcademicPortfolioDetails({required String userID}) async {
    try {
      emit(AcademicPortfolioLoading());
      PortfolioDetailsModel result = await PortfolioRemoteDataSource()
          .fetchPortfolioDetails(userID: userID);
      emit(AcademicPortfolioLoaded(portfolioDetailsModel: result));
    } on DioException catch (error) {
      emit(AcademicPortfolioError(errorMsg: error.response!.data["message"]));
    }
  }
}
