import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/core/datasource/portfolio_remote_datasource.dart';
import 'package:find_me/core/models/portfolio_set_model.dart';
import 'package:meta/meta.dart';

part 'academic_details_state.dart';

class AcademicDetailsCubit extends Cubit<AcademicDetailsState> {
  AcademicDetailsCubit() : super(AcademicDetailsInitial());

  createAcademicDetails({required PortfolioSetModel data}) async {
    try {
      emit(AcademicDetailsLoading());
      PortfolioSetModel result =
          await PortfolioRemoteDataSource().createPortfolio(data: data);
      emit(AcademicDetailsLoaded(portfolioModel: result));
    } on DioException catch (error) {
      emit(AcademicDetailsError(errorMsg: error.response!.data["message"]));
    }
  }
}
