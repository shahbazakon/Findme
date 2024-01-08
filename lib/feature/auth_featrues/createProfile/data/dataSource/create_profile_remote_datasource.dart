import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/auth_featrues/createProfile/data/models/complete_profile_model.dart';

class CreateProfileRemoteDataSource {
  API api = API();
  Future<ProfileModel> createProfile({required ProfileModel data}) async {
    try {
      final Response response = await api.sendRequest.patch(
          "/admin/update/${data.result!.resultId}",
          data: data.toJson(),
          options: Options(headers: {'Content-Type': 'application/json'}));
      final status = await hanldeStatusCode(response);
      if (status.status) {
        ProfileModel data = ProfileModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
