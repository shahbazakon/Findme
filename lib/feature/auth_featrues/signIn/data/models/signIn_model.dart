import 'dart:convert';

class SignInModel {
  final bool? success;
  final Result? result;
  final String? message;

  SignInModel({
    this.success,
    this.result,
    this.message,
  });

  SignInModel copyWith({
    bool? success,
    Result? result,
    String? message,
  }) =>
      SignInModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory SignInModel.fromRawJson(String str) =>
      SignInModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
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
  final String? token;
  final Admin? admin;

  Result({
    this.token,
    this.admin,
  });

  Result copyWith({
    String? token,
    Admin? admin,
  }) =>
      Result(
        token: token ?? this.token,
        admin: admin ?? this.admin,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        token: json["token"],
        admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "admin": admin?.toJson(),
      };
}

class Admin {
  final String? name;
  final List<dynamic>? picture;
  final String? adminId;
  final bool? isLoggedIn;
  final String? role;
  final String? id;
  final bool? isCompeletProfile;

  Admin({
    this.name,
    this.picture,
    this.adminId,
    this.isLoggedIn,
    this.role,
    this.id,
    this.isCompeletProfile,
  });

  Admin copyWith({
    String? name,
    List<dynamic>? picture,
    String? adminId,
    bool? isLoggedIn,
    String? role,
    String? id,
    bool? isCompeletProfile,
  }) =>
      Admin(
        name: name ?? this.name,
        picture: picture ?? this.picture,
        adminId: adminId ?? this.adminId,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        role: role ?? this.role,
        id: id ?? this.id,
        isCompeletProfile: isCompeletProfile ?? this.isCompeletProfile,
      );

  factory Admin.fromRawJson(String str) => Admin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        name: json["name"],
        picture: json["picture"] == null
            ? []
            : List<dynamic>.from(json["picture"]!.map((x) => x)),
        adminId: json["id"],
        isLoggedIn: json["isLoggedIn"],
        role: json["role"],
        id: json["_id"],
        isCompeletProfile: json["isCompeletProfile"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "picture":
            picture == null ? [] : List<dynamic>.from(picture!.map((x) => x)),
        "id": adminId,
        "isLoggedIn": isLoggedIn,
        "role": role,
        "_id": id,
        "isCompeletProfile": isCompeletProfile,
      };
}
