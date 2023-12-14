part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final NotificationModel notificationModel;
  NotificationLoaded({required this.notificationModel});
}

class NotificationError extends NotificationState {
  final String errorMsg;
  NotificationError({required this.errorMsg});
}
