import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/reset_password/data/Models/reset_password_model.dart';

class ResetPasswordDataSource {
  API api = API();
  Future<ResetPasswordModel> resetPassword(
      {required String password, required String confirmPassword, required String id}) async {
    try {
      final Response response = await api.sendRequest.put("/auth/resetPassword/$id",
          data: {"password": password, "confirmPassword": confirmPassword});
      final status = await hanldeStatusCode(response);
      if (status.status) {
        ResetPasswordModel data = ResetPasswordModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      showSnackBar(title: "$error");
      rethrow;
    }
  }
}
