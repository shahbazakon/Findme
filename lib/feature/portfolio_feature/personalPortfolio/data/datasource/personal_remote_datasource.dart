import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/data/models/personal_details_model.dart';

class PersonalRemoteDataSource {
  API api = API();
  Future<PersonalDetailsModel> fetchPersonalDetails(
      {required String cardID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/card/read/$cardID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        PersonalDetailsModel data =
            PersonalDetailsModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
