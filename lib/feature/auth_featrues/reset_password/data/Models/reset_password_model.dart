import 'dart:convert';

class ResetPasswordModel {
  final bool? success;
  final Result? result;
  final String? message;

  ResetPasswordModel({
    this.success,
    this.result,
    this.message,
  });

  ResetPasswordModel copyWith({
    bool? success,
    Result? result,
    String? message,
  }) =>
      ResetPasswordModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory ResetPasswordModel.fromRawJson(String str) =>
      ResetPasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
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
