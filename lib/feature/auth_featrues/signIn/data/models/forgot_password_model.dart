import 'dart:convert';

class ForgotPasswordModel {
  final bool? success;
  final Result? result;
  final String? message;

  ForgotPasswordModel({
    this.success,
    this.result,
    this.message,
  });

  ForgotPasswordModel copyWith({
    bool? success,
    Result? result,
    String? message,
  }) =>
      ForgotPasswordModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory ForgotPasswordModel.fromRawJson(String str) =>
      ForgotPasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        success: json["success"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
        "message": message,
      };
}

class Result {
  final String? id;
  final String? email;

  Result({
    this.id,
    this.email,
  });

  Result copyWith({
    String? id,
    String? email,
  }) =>
      Result(
        id: id ?? this.id,
        email: email ?? this.email,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
      };
}
