import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/portfolio_feature/corporatePortfolio/data/models/corporate_details+model.dart';

class CorporateRemoteDataSource {
  API api = API();
  Future<CorporateDetailsModel> fetchCorporateDetails(
      {required String cardID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/card/read/$cardID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        CorporateDetailsModel data =
            CorporateDetailsModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
