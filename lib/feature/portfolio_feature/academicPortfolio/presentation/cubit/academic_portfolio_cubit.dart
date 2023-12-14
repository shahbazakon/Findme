import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/portfolio_get_model.dart';
import 'package:meta/meta.dart';

part 'academic_portfolio_state.dart';

class AcademicPortfolioCubit extends Cubit<AcademicPortfolioState> {
  AcademicPortfolioCubit() : super(AcademicPortfolioInitial());

  fetchAcademicPortfolioDetails({required String userID}) async {
    try {
      emit(AcademicPortfolioLoading());
      PortfolioGetModel result = await PortfolioRemoteDataSource()
          .fetchPortfolioDetails(userID: userID);
      emit(AcademicPortfolioLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(AcademicPortfolioError(errorMsg: error.response!.data["message"]));
    }
  }
}
