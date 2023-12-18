import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/portfolio_feature/matrimonyPortfolio/data/models/matrimonial_details_models.dart';

class MatrimonialRemoteDataSource {
  API api = API();
  Future<MatrimonialDetailsModel> fetchMatrimonialDetails(
      {required String cardID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/card/read/$cardID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        MatrimonialDetailsModel data =
            MatrimonialDetailsModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
