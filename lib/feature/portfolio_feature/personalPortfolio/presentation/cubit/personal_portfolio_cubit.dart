import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/data/datasource/personal_remote_datasource.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/data/models/personal_details_model.dart';
import 'package:meta/meta.dart';

part 'personal_portfolio_state.dart';

class PersonalPortfolioCubit extends Cubit<PersonalPortfolioState> {
  PersonalPortfolioCubit() : super(PersonalPortfolioInitial());

  fetchPersonalPortfolioDetails({required String cardID}) async {
    try {
      emit(PersonalPortfolioLoading());
      PersonalDetailsModel result =
          await PersonalRemoteDataSource().fetchPersonalDetails(cardID: cardID);
      emit(PersonalPortfolioLoaded(personalDetailsModel: result));
    } on DioException catch (error) {
      emit(PersonalPortfolioError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
