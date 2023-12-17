import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/contacts/data/datasource/search_user_remote_datasource.dart';
import 'package:find_me/feature/contacts/data/model/search_user_model.dart';
import 'package:meta/meta.dart';

part 'search_user_state.dart';

class SearchUserCubit extends Cubit<SearchUserState> {
  SearchUserCubit() : super(SearchUserInitial());

  fetchSearchedResult({required String query}) async {
    try {
      emit(SearchUserLoading());
      SearchUserModel result = await SearchUserRemoteDataSource()
          .fetchSearchedUserData(query: query);
      emit(SearchUserLoaded(searchUserModel: result));
    } on DioException catch (error) {
      emit(SearchUserError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
