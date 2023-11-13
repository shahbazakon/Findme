import 'package:find_me/core/api%20/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/auth_featrues/signIn/data/models/signIn_model.dart';

class SignInDataSource {
  API api = API();
  Future<SignInModel> fetchSignIn() async {
    try {
      final response = await api.sendRequest.post("/auth/login",
          data: {"email": "anurag.dhunna@gmail.com", "password": "12345678"});
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
}
