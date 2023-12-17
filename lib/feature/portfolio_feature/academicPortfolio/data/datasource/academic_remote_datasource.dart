import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/portfolio_feature/academicPortfolio/data/models/academic_details_model.dart';

class AcademicRemoteDataSource {
  API api = API();
  Future<AcademicDetailsModel> fetchAcademicDetails(
      {required String cardID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/user/read/$cardID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        AcademicDetailsModel data =
            AcademicDetailsModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
