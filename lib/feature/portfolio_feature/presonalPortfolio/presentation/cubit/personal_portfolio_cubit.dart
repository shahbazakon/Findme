import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/portfolio_get_model.dart';
import 'package:meta/meta.dart';

part 'personal_portfolio_state.dart';

class PersonalPortfolioCubit extends Cubit<PersonalPortfolioState> {
  PersonalPortfolioCubit() : super(PersonalPortfolioInitial());
  fetchPersonalPortfolioDetails({required String userID}) async {
    try {
      emit(PersonalPortfolioLoading());
      PortfolioGetModel result = await PortfolioRemoteDataSource()
          .fetchPortfolioDetails(userID: userID);
      emit(PersonalPortfolioLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(PersonalPortfolioError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
