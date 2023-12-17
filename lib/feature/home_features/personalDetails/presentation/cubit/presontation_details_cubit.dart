import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/portfolio_set_model.dart';
import 'package:find_me/feature/home_features/personalDetails/presentation/cubit/presontation_details_state.dart';

class PersonalDetailsCubit extends Cubit<PersonalDetailsState> {
  PersonalDetailsCubit() : super(PersonalDetailsInitial());

  createPersonalDetails({required PortfolioSetModel data}) async {
    try {
      emit(PersonalDetailsLoading());
      PortfolioSetModel result =
          await PortfolioRemoteDataSource().createPortfolio(data: data);
      emit(PersonalDetailsLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(PersonalDetailsError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
