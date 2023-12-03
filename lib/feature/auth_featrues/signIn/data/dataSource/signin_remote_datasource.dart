import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/models/forgot_password_model.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/models/signIn_model.dart';

class SignInDataSource {
  API api = API();
  Future<SignInModel> fetchSignIn({required Map requestBody}) async {
    try {
      final response = await api.sendRequest.post("/auth/login", data: requestBody);
      final status = await hanldeStatusCode(response);
      if (status.status) {
        SignInModel data = SignInModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      showSnackBar(title: "$error");
      rethrow;
    }
  }

  Future<ForgotPasswordModel> forgotPassword({required Map requestBody}) async {
    try {
      final response = await api.sendRequest.put("/auth/forgetPassword", data: requestBody);
      final status = await hanldeStatusCode(response);
      if (status.status) {
        ForgotPasswordModel data = ForgotPasswordModel.fromJson(response.data);
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
