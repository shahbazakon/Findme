import 'package:dio/dio.dart';
import 'package:find_me/core/api%20/api.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/createProfile/data/models/complete_profile_model.dart';

class CreateProfileRemoteDataSource {
  API api = API();
  Future<CompleteProfileModel> createProfile({
    String? name,
    String? email,
    String? country,
    String? countryCode,
    String? statue,
    String? id,
  }) async {
    try {
      Map data = {
        "success": true,
        "result": {
          "ipDetail": {
            "country_code": countryCode,
            "country_name": country,
            "city": "",
            "postal": "",
            // "latitude": "30",
            // "longitude": "70",
            // "IPv4": "39.63.60.16",
            "state": statue
          },
          "createdat": "2023-08-08",
          "avatar":
              "https://res.cloudinary.com/devatchannel/image/upload/v1602752402/avatar/avatar_cugq40.png",
          "_id": id,
          "email": email,
          "name": name,
          "createdAt": "2023-08-22T09:59:20.045Z",
          "updatedAt": "2023-11-15T13:26:47.725Z",
          "isLoggedIn": true,
          // "address": "Abc xyz Lahore xyz",
          "country": country,
          "dob": "2023-11-13T19:00:00.000Z",
          "number": "3364722783",
          "phoneCode": countryCode,
          "userName": name,
        },
        "message": "Update Successfully"
      };
      // Replace this with your actual headers
      Map<String, dynamic> headers = {
        "x-auth-token":
            sharedPreferences!.getString(LocaleStorageKey.xAuthToken),
      };
      final Response response = await api.sendRequest.patch(
        "/admin/update/64e486f81204ed8005072b91",
        data: data,
        options: Options(headers: headers),
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        CompleteProfileModel data =
            CompleteProfileModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
