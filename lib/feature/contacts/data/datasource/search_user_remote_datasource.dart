import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/contacts/data/model/search_user_model.dart';

class SearchUserRemoteDataSource {
  API api = API();
  Future<SearchUserModel> fetchSearchedUserData({required String query}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/user/search?q=$query&fields=userName",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        SearchUserModel data = SearchUserModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
