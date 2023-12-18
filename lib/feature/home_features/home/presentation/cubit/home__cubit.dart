import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/home_features/home/data/datasource/home_remote_data_source.dart';
import 'package:find_me/feature/home_features/home/data/models/home_model.dart';
import 'package:meta/meta.dart';

part 'home__state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  fetchHomeData({required String id}) async {
    try {
      emit(HomeLoading());
      HomeModel result = await HomeRemoteDataSource().fetchHomeData(userID: id);

      emit(HomeLoaded(homeModel: result));
    } on DioException catch (error) {
      emit(HomeError(errorMsg: error.response?.data["message"]));
    }
  }
}
