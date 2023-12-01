import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:find_me/core/api%20/api.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/models/protfolio_model.dart';
import 'package:find_me/core/utils/utils_methods.dart';

class PortfolioRemoteDataSource {
  API api = API();
  Future<PortfolioModel> createPortfolio({required PortfolioModel data}) async {
    log("data: ${data.toJson()}");
    try {
      // Replace this with your actual headers
      Map<String, dynamic> headers = {
        "x-auth-token":
            sharedPreferences!.getString(LocaleStorageKey.xAuthToken),
      };
      final Response response = await api.sendRequest.post(
        "/card/create",
        data: data.toJson(),
        options: Options(headers: headers),
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
