import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/notifications/data/Models/notification_model.dart';

class NotificationRemoteDataSource {
  API api = API();
  Future<NotificationModel> fetchNotification({required String userID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/notification/list?f1=false&f2=$userID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        NotificationModel data = NotificationModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
