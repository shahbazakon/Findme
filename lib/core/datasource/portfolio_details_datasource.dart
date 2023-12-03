import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:find_me/core/api%20/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/models/protfolio_model.dart';

class PortfolioRemoteDataSource {
  API api = API();
  Future<PortfolioModel> createPortfolio({required PortfolioModel data}) async {
    log("data: ${data.toJson()}");
    try {
      // Replace this with your actual headers

      final Response response = await api.sendRequest.post(
        "/card/create",
        data: data.toJson(),
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        PortfolioModel data = PortfolioModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
