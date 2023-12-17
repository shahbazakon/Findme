import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_me/feature/notifications/data/Models/notification_model.dart';
import 'package:find_me/feature/notifications/data/datasource/notification_remote_datasourcce.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  fetchNotification({required String userID}) async {
    try {
      emit(NotificationLoading());
      NotificationModel result = await NotificationRemoteDataSource()
          .fetchNotification(userID: userID);
      emit(NotificationLoaded(notificationModel: result));
    } on DioException catch (error) {
      emit(NotificationError(
          errorMsg: error.response?.data["message"] ?? "$error"));
    }
  }
}
