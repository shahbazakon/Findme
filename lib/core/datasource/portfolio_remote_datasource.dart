import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/models/portfolio_get_model.dart';
import 'package:find_me/core/models/portfolio_set_model.dart';

class PortfolioRemoteDataSource {
  API api = API();
  Future<PortfolioSetModel> createPortfolio(
      {required PortfolioSetModel data}) async {
    log("data: ${data.toJson()}");
    try {
      final Response response = await api.sendRequest.post(
        "/card/create",
        data: data.toJson(),
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        PortfolioSetModel data = PortfolioSetModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<PortfolioGetModel> fetchPortfolioDetails(
      {required String userID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/user/read/$userID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        PortfolioGetModel data = PortfolioGetModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
