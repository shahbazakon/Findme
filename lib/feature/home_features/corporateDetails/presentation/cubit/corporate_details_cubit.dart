import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/protfolio_model.dart';
import 'package:find_me/feature/home_features/corporateDetails/presentation/cubit/corporate_details_state.dart';

class CorporateDetailsCubit extends Cubit<CorporateDetailsState> {
  CorporateDetailsCubit() : super(CorporateDetailsInitial());

  createCorporateDetails({required PortfolioModel data}) async {
    try {
      emit(CorporateDetailsLoading());
      PortfolioModel result =
          await PortfolioRemoteDataSource().createPortfolio(data: data);
      emit(CorporateDetailsLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(CorporateDetailsError(errorMsg: error.response!.data["message"]));
    }
  }
}
