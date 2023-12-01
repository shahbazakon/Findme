import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_details_datasource.dart';
import 'package:find_me/core/models/protfolio_model.dart';
import 'package:find_me/feature/home_features/businessDetails/presentation/cubit/business_details_state.dart';

class BusinessDetailsCubit extends Cubit<BusinessDetailsState> {
  BusinessDetailsCubit() : super(BusinessDetailsInitial());

  createBusinessDetails({required PortfolioModel data}) async {
    try {
      emit(BusinessDetailsLoading());
      PortfolioModel result =
          await PortfolioRemoteDataSource().createPortfolio(data: data);
      emit(BusinessDetailsLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(BusinessDetailsError(errorMsg: error.response!.data["message"]));
    }
  }
}
