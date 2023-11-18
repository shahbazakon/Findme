import 'package:dio/dio.dart';
import 'package:find_me/core/api%20/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/signUp/data/models/signup_model.dart';

class SignUpDataSource {
  API api = API();
  Future<SignUpModel> fetchSignUp({required Map requestBody}) async {
    try {
      final responce =
          await api.sendRequest.post("/auth/register", data: requestBody);
      final status = await hanldeStatusCode(responce);
      if (status.status) {
        SignUpModel data = SignUpModel.fromJson(responce.data);
        return data;
      } else {
        throw status.failure!;
      }
    } on DioException catch (error) {
      showSnackBar(title: "${error.response!.data["message"]}");
      rethrow;
    }
  }
}
