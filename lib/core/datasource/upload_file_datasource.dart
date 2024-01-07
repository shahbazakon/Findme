import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentRemoteDataSource {
  API api = API();
  Future<String> upload(
      {required String folderName, required XFile file}) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file.path, filename: file.name),
      });
      final Response response = await api.sendRequest
          .post("/s3link/image?folder=$folderName", data: formData);
      final status = await hanldeStatusCode(response);
      if (status.status) {
        String data = response.data["link"];
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
