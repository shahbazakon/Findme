import 'dart:convert';

import 'package:find_me/core/models/follow_model.dart';

class ContactModel {
  final bool? success;
  final List<ContactResult>? result;
  final String? message;

  ContactModel({
    this.success,
    this.result,
    this.message,
  });

  ContactModel copyWith({
    bool? success,
    List<ContactResult>? result,
    String? message,
  }) =>
      ContactModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory ContactModel.fromRawJson(String str) =>
      ContactModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        success: json["success"],
        result: json["result"] == null
            ? []
            : List<ContactResult>.from(
                json["result"]!.map((x) => ContactResult.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "message": message,
      };
}

class ContactResult {
  final bool? status;
  final String? resultId;
  final Follow? follower;
  final Follow? following;
  final String? description;
  final DateTime? created;
  final int? id;
  final int? v;

  ContactResult({
    this.status,
    this.resultId,
    this.follower,
    this.following,
    this.description,
    this.created,
    this.id,
    this.v,
  });

  ContactResult copyWith({
    bool? status,
    String? resultId,
    Follow? follower,
    Follow? following,
    String? description,
    DateTime? created,
    int? id,
    int? v,
  }) =>
      ContactResult(
        status: status ?? this.status,
        resultId: resultId ?? this.resultId,
        follower: follower ?? this.follower,
        following: following ?? this.following,
        description: description ?? this.description,
        created: created ?? this.created,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory ContactResult.fromRawJson(String str) =>
      ContactResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactResult.fromJson(Map<String, dynamic> json) => ContactResult(
        status: json["status"],
        resultId: json["_id"],
        follower:
            json["follower"] == null ? null : Follow.fromJson(json["follower"]),
        following: json["following"] == null
            ? null
            : Follow.fromJson(json["following"]),
        description: json["description"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        id: json["Id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": resultId,
        "follower": follower?.toJson(),
        "following": following?.toJson(),
        "description": description,
        "created": created?.toIso8601String(),
        "Id": id,
        "__v": v,
      };
}
