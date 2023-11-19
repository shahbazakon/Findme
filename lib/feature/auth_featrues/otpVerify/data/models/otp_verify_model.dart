import 'dart:convert';

class OtpVerifyModel {
  final bool? success;
  final Result? result;
  final String? message;

  OtpVerifyModel({
    this.success,
    this.result,
    this.message,
  });

  OtpVerifyModel copyWith({
    bool? success,
    Result? result,
    String? message,
  }) =>
      OtpVerifyModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory OtpVerifyModel.fromRawJson(String str) =>
      OtpVerifyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) => OtpVerifyModel(
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
  final int? otp;

  Result({
    this.id,
    this.otp,
  });

  Result copyWith({
    String? id,
    int? otp,
  }) =>
      Result(
        id: id ?? this.id,
        otp: otp ?? this.otp,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "otp": otp,
      };
}
