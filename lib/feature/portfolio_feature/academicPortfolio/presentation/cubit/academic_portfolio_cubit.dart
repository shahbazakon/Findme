import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/portfolio_feature/academicPortfolio/data/datasource/academic_remote_datasource.dart';
import 'package:find_me/feature/portfolio_feature/academicPortfolio/data/models/academic_details_model.dart';
import 'package:meta/meta.dart';

part 'academic_portfolio_state.dart';

class AcademicPortfolioCubit extends Cubit<AcademicPortfolioState> {
  AcademicPortfolioCubit() : super(AcademicPortfolioInitial());

  fetchAcademicPortfolioDetails({required String userID}) async {
    try {
      emit(AcademicPortfolioLoading());
      AcademicDetailsModel result =
          await AcademicRemoteDataSource().fetchAcademicDetails(cardID: userID);
      emit(AcademicPortfolioLoaded(academicDetailsModel: result));
    } on DioException catch (error) {
      emit(AcademicPortfolioError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
