import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/settings_features/followRequest/data/models/search_model.dart';

class FollowRequestRemoteDataSource {
  API api = API();
  Future<SearchModel> search(
      {required String query, String fields = "userName"}) async {
    try {
      final Response response =
          await api.sendRequest.get("/user/search?q=$query&fields=$fields");
      final status = await hanldeStatusCode(response);
      if (status.status) {
        SearchModel data = SearchModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
