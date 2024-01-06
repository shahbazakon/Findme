import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/data/models/matrimonial_%20Model.dart';

class MatrimonialDetailsRemoteDataSource {
  API api = API();
  Future<MatrimonialModel> createPortfolio(
      {required MatrimonialModel data}) async {
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
        MatrimonialModel data = MatrimonialModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
