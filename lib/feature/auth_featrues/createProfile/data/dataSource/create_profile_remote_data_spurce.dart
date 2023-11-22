import 'package:dio/dio.dart';
import 'package:find_me/core/api%20/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/auth_featrues/createProfile/data/models/complete_profile_model.dart';

class CreateProfileRemoteDataSource {
  API api = API();
  Future<CompleteProfileModel> createProfile() async {
    try {
      final Response response =
          await api.sendRequest.patch("/admin/update/", data: {});
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
