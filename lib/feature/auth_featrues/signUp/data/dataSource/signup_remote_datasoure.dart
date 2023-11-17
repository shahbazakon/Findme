import 'package:find_me/core/api%20/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/auth_featrues/signUp/data/models/signup_model.dart';

class SignUpDataSource {
  API api = API();
  Future<SignUpModel> fetchSignUp({required Map requestBody}) async {
    try {
      Map temp = {
        "name": "Haris",
        "email": "harismkt11@gmail.com",
        "password": "12345678",
        "cf_password": "12345678",
        "ipDetail": {
          "country_code": "PK",
          "country_name": "Pakistan",
          "city": null,
          "postal": null,
          "latitude": 30,
          "longitude": 70,
          "IPv4": "39.63.50.22",
          "state": null
        }
      };
      final responce = await api.sendRequest.post("/auth/register", data: temp);
      final status = await hanldeStatusCode(responce);
      if (status.status) {
        SignUpModel data = SignUpModel.fromJson(responce.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
