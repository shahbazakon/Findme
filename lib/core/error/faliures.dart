import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';

abstract class Failure extends Equatable {
  final String? responseMsg;

  const Failure(this.responseMsg);
  @override
  List<Object> get props => [];
  String? get apiMsg;
  String displayErrorMessage();
}

//Unauthorized
class Unauthorized extends Failure {
  final String? message;
  const Unauthorized({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "Invalid Passcode";
  }
}

// General failures
class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message}) : super(message);
  @override
  displayErrorMessage() {
    return message ?? "Something went wrong,try again later";
  }

  @override
  // TODO: implement apiMsg
  String? get apiMsg => message;
}

class NotFoundFailure extends Failure {
  final String? message;
  const NotFoundFailure({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "The requested resource was not found";
  }
}

class InternalServerError extends Failure {
  final String? message;
  const InternalServerError({this.message}) : super(message);
  @override
  String? get apiMsg => message;
  @override
  displayErrorMessage() {
    return "An unexpected error occurred";
  }
}

class ServerStatus {
  final bool status;
  Failure? failure;

  ServerStatus({required this.status, required this.failure});
}

Future<ServerStatus> hanldeStatusCode(Response<dynamic> result) async {
  if (result.statusCode == 201 || result.statusCode == 200) {
    return ServerStatus(status: true, failure: null);
  } else if (result.statusCode == 401) {
    return ServerStatus(
        status: false,
        failure: Unauthorized(
            message: result.data['message'] ?? "User is not authenticated"));
  } else if (result.statusCode == 401) {
    return ServerStatus(
        status: false,
        failure: Unauthorized(
            message: result.data['message'] ?? "User is not authenticated"));
  } else if (result.statusCode == 404) {
    return ServerStatus(
        status: false,
        failure: NotFoundFailure(
            message: result.data['message'] ??
                "The requested resource was not found"));
  } else if (result.statusCode == 500) {
    return ServerStatus(
        status: false,
        failure: InternalServerError(
            message: result.data['message'] ?? "An unexpected error occurred"));
  } else {
    if (result.data['message'] != null) {
      showSnackBar(title: "${result.data['message']}");
    }
    return ServerStatus(status: false, failure: const ServerFailure());
  }
}
