import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/portfolio_set_model.dart';
import 'package:find_me/feature/home_features/businessDetails/presentation/cubit/business_details_state.dart';

class BusinessDetailsCubit extends Cubit<BusinessDetailsState> {
  BusinessDetailsCubit() : super(BusinessDetailsInitial());

  createBusinessDetails({required PortfolioSetModel data}) async {
    try {
      emit(BusinessDetailsLoading());
      PortfolioSetModel result =
          await PortfolioRemoteDataSource().createPortfolio(data: data);
      emit(BusinessDetailsLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(BusinessDetailsError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
