import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/contacts/data/datasource/contacts_remote_data_source.dart';
import 'package:find_me/feature/contacts/data/model/search_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  searchFollow({required String query, String? fields}) async {
    try {
      emit(SearchLoading());
      SearchModel result = await ContactsRemoteDataSource()
          .search(query: query, fields: fields ?? "userName");
      emit(SearchLoaded(searchModel: result));
    } on DioException catch (error) {
      emit(SearchError(errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
