import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_details_datasource.dart';
import 'package:find_me/core/models/protfolio_model.dart';
import 'package:find_me/feature/home_features/personalDetails/presentation/cubit/presontation_details_state.dart';

class PersonalDetailsCubit extends Cubit<PersonalDetailsState> {
  PersonalDetailsCubit() : super(PersonalDetailsInitial());

  createPersonalDetails({required PortfolioModel data}) async {
    try {
      emit(PersonalDetailsLoading());
      PortfolioModel result =
          await PortfolioRemoteDataSource().createPortfolio(data: data);
      emit(PersonalDetailsLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(PersonalDetailsError(errorMsg: error.response!.data["message"]));
    }
  }
}
