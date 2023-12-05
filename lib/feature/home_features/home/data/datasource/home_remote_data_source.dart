import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/home_features/home/data/models/home_model.dart';

class HomeRemoteDataSource {
  API api = API();
  Future<HomeModel> fetchHomeData({required String id}) async {
    try {
      // Replace this with your actual headers
      final Response response = await api.sendRequest.get(
        "/card/listbyuser/$id",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        HomeModel data = HomeModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
