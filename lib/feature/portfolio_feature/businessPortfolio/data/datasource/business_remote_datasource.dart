import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/portfolio_feature/businessPortfolio/data/models/business_details_model.dart';

class BusinessRemoteDataSource {
  API api = API();
  Future<BusinessDetailsModel> fetchBusinessDetails(
      {required String cardID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/card/read/$cardID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        BusinessDetailsModel data =
            BusinessDetailsModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
