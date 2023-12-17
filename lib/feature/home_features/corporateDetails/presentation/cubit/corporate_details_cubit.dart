import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/portfolio_set_model.dart';
import 'package:find_me/feature/home_features/corporateDetails/presentation/cubit/corporate_details_state.dart';

class CorporateDetailsCubit extends Cubit<CorporateDetailsState> {
  CorporateDetailsCubit() : super(CorporateDetailsInitial());

  createCorporateDetails({required PortfolioSetModel data}) async {
    try {
      emit(CorporateDetailsLoading());
      PortfolioSetModel result =
          await PortfolioRemoteDataSource().createPortfolio(data: data);
      emit(CorporateDetailsLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(CorporateDetailsError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
