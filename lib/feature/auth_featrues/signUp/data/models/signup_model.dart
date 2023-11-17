import 'dart:convert';

class SignUpModel {
  final bool? success;
  final List<String>? result;
  final String? message;

  SignUpModel({
    this.success,
    this.result,
    this.message,
  });

  SignUpModel copyWith({
    bool? success,
    List<String>? result,
    String? message,
  }) =>
      SignUpModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory SignUpModel.fromRawJson(String str) =>
      SignUpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["success"],
        result: json["result"] == null
            ? []
            : List<String>.from(json["result"]!.map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result":
            result == null ? [] : List<dynamic>.from(result!.map((x) => x)),
        "message": message,
      };
}
