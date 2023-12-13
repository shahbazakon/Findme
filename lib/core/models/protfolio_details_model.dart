import 'dart:convert';

class PortfolioDetailsModel {
  final bool? success;
  final PortfolioResult? result;
  final String? message;

  PortfolioDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  PortfolioDetailsModel copyWith({
    bool? success,
    PortfolioResult? result,
    String? message,
  }) =>
      PortfolioDetailsModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory PortfolioDetailsModel.fromRawJson(String str) =>
      PortfolioDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PortfolioDetailsModel.fromJson(Map<String, dynamic> json) =>
      PortfolioDetailsModel(
        success: json["success"],
        result: json["result"] == null
            ? null
            : PortfolioResult.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
        "message": message,
      };
}

class Follow {
  final bool? status;
  final String? followId;
  final PortfolioResult? follower;
  final PortfolioResult? following;
  final String? description;
  final DateTime? created;
  final int? id;
  final int? v;

  Follow({
    this.status,
    this.followId,
    this.follower,
    this.following,
    this.description,
    this.created,
    this.id,
    this.v,
  });

  Follow copyWith({
    bool? status,
    String? followId,
    PortfolioResult? follower,
    PortfolioResult? following,
    String? description,
    DateTime? created,
    int? id,
    int? v,
  }) =>
      Follow(
        status: status ?? this.status,
        followId: followId ?? this.followId,
        follower: follower ?? this.follower,
        following: following ?? this.following,
        description: description ?? this.description,
        created: created ?? this.created,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Follow.fromRawJson(String str) => Follow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        status: json["status"],
        followId: json["_id"],
        follower: json["follower"] == null
            ? null
            : PortfolioResult.fromJson(json["follower"]),
        following: json["following"] == null
            ? null
            : PortfolioResult.fromJson(json["following"]),
        description: json["description"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        id: json["Id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": followId,
        "follower": follower?.toJson(),
        "following": following?.toJson(),
        "description": description,
        "created": created?.toIso8601String(),
        "Id": id,
        "__v": v,
      };
}

class PortfolioResult {
  final IpDetail? ipDetail;
  final bool? removed;
  final bool? enabled;
  final bool? isCompeletProfile;
  final bool? isAdmin;
  final String? role;
  final bool? root;
  final DateTime? createdat;
  final String? avatar;
  final String? resultId;
  final String? email;
  final String? password;
  final String? name;
  final String? purpleId;
  final List<dynamic>? mobileCover;
  final List<Cover>? cover;
  final List<Cover>? picture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final int? v;
  final bool? isLoggedIn;
  final String? address;
  final String? country;
  final String? dob;
  final String? number;
  final String? phoneCode;
  final String? userName;
  final int? otp;
  final String? tag;
  final List<Follow>? follower;
  final List<Follow>? following;
  final String? status;

  PortfolioResult({
    this.ipDetail,
    this.removed,
    this.enabled,
    this.isCompeletProfile,
    this.isAdmin,
    this.role,
    this.root,
    this.createdat,
    this.avatar,
    this.resultId,
    this.email,
    this.password,
    this.name,
    this.purpleId,
    this.mobileCover,
    this.cover,
    this.picture,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.v,
    this.isLoggedIn,
    this.address,
    this.country,
    this.dob,
    this.number,
    this.phoneCode,
    this.userName,
    this.otp,
    this.tag,
    this.follower,
    this.following,
    this.status,
  });

  PortfolioResult copyWith({
    IpDetail? ipDetail,
    bool? removed,
    bool? enabled,
    bool? isCompeletProfile,
    bool? isAdmin,
    String? role,
    bool? root,
    DateTime? createdat,
    String? avatar,
    String? resultId,
    String? email,
    String? password,
    String? name,
    String? purpleId,
    List<dynamic>? mobileCover,
    List<Cover>? cover,
    List<Cover>? picture,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? v,
    bool? isLoggedIn,
    String? address,
    String? country,
    String? dob,
    String? number,
    String? phoneCode,
    String? userName,
    int? otp,
    String? tag,
    List<Follow>? follower,
    List<Follow>? following,
    String? status,
  }) =>
      PortfolioResult(
        ipDetail: ipDetail ?? this.ipDetail,
        removed: removed ?? this.removed,
        enabled: enabled ?? this.enabled,
        isCompeletProfile: isCompeletProfile ?? this.isCompeletProfile,
        isAdmin: isAdmin ?? this.isAdmin,
        role: role ?? this.role,
        root: root ?? this.root,
        createdat: createdat ?? this.createdat,
        avatar: avatar ?? this.avatar,
        resultId: resultId ?? this.resultId,
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        purpleId: purpleId ?? this.purpleId,
        mobileCover: mobileCover ?? this.mobileCover,
        cover: cover ?? this.cover,
        picture: picture ?? this.picture,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        v: v ?? this.v,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        address: address ?? this.address,
        country: country ?? this.country,
        dob: dob ?? this.dob,
        number: number ?? this.number,
        phoneCode: phoneCode ?? this.phoneCode,
        userName: userName ?? this.userName,
        otp: otp ?? this.otp,
        tag: tag ?? this.tag,
        follower: follower ?? this.follower,
        following: following ?? this.following,
        status: status ?? this.status,
      );

  factory PortfolioResult.fromRawJson(String str) =>
      PortfolioResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PortfolioResult.fromJson(Map<String, dynamic> json) =>
      PortfolioResult(
        ipDetail: json["ipDetail"] == null
            ? null
            : IpDetail.fromJson(json["ipDetail"]),
        removed: json["removed"],
        enabled: json["enabled"],
        isCompeletProfile: json["isCompeletProfile"],
        isAdmin: json["isAdmin"],
        role: json["role"],
        root: json["root"],
        createdat: json["createdat"] == null
            ? null
            : DateTime.parse(json["createdat"]),
        avatar: json["avatar"],
        resultId: json["_id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        purpleId: json["id"],
        mobileCover: json["mobileCover"] == null
            ? []
            : List<dynamic>.from(json["mobileCover"]!.map((x) => x)),
        cover: json["cover"] == null
            ? []
            : List<Cover>.from(json["cover"]!.map((x) => Cover.fromJson(x))),
        picture: json["picture"] == null
            ? []
            : List<Cover>.from(json["picture"]!.map((x) => Cover.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["Id"],
        v: json["__v"],
        isLoggedIn: json["isLoggedIn"],
        address: json["address"],
        country: json["country"],
        dob: json["dob"],
        number: json["number"],
        phoneCode: json["phoneCode"],
        userName: json["userName"],
        otp: json["otp"],
        tag: json["tag"],
        follower: json["follower"] == null
            ? []
            : List<Follow>.from(
                json["follower"]!.map((x) => Follow.fromJson(x))),
        following: json["following"] == null
            ? []
            : List<Follow>.from(
                json["following"]!.map((x) => Follow.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ipDetail": ipDetail?.toJson(),
        "removed": removed,
        "enabled": enabled,
        "isCompeletProfile": isCompeletProfile,
        "isAdmin": isAdmin,
        "role": role,
        "root": root,
        "createdat":
            "${createdat!.year.toString().padLeft(4, '0')}-${createdat!.month.toString().padLeft(2, '0')}-${createdat!.day.toString().padLeft(2, '0')}",
        "avatar": avatar,
        "_id": resultId,
        "email": email,
        "password": password,
        "name": name,
        "id": purpleId,
        "mobileCover": mobileCover == null
            ? []
            : List<dynamic>.from(mobileCover!.map((x) => x)),
        "cover": cover == null
            ? []
            : List<dynamic>.from(cover!.map((x) => x.toJson())),
        "picture": picture == null
            ? []
            : List<dynamic>.from(picture!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Id": id,
        "__v": v,
        "isLoggedIn": isLoggedIn,
        "address": address,
        "country": country,
        "dob": dob,
        "number": number,
        "phoneCode": phoneCode,
        "userName": userName,
        "otp": otp,
        "tag": tag,
        "follower": follower == null
            ? []
            : List<dynamic>.from(follower!.map((x) => x.toJson())),
        "following": following == null
            ? []
            : List<dynamic>.from(following!.map((x) => x.toJson())),
        "status": status,
      };
}

class Cover {
  final String? id;
  final String? url;
  final String? thumbUrl;
  final String? uid;
  final String? name;
  final String? status;
  final String? type;

  Cover({
    this.id,
    this.url,
    this.thumbUrl,
    this.uid,
    this.name,
    this.status,
    this.type,
  });

  Cover copyWith({
    String? id,
    String? url,
    String? thumbUrl,
    String? uid,
    String? name,
    String? status,
    String? type,
  }) =>
      Cover(
        id: id ?? this.id,
        url: url ?? this.url,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        status: status ?? this.status,
        type: type ?? this.type,
      );

  factory Cover.fromRawJson(String str) => Cover.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        id: json["_id"],
        url: json["url"],
        thumbUrl: json["thumbUrl"],
        uid: json["uid"],
        name: json["name"],
        status: json["status"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
        "thumbUrl": thumbUrl,
        "uid": uid,
        "name": name,
        "status": status,
        "type": type,
      };
}

class IpDetail {
  final String? countryCode;
  final String? countryName;
  final String? city;
  final String? postal;
  final String? latitude;
  final String? longitude;
  final String? iPv4;
  final String? state;

  IpDetail({
    this.countryCode,
    this.countryName,
    this.city,
    this.postal,
    this.latitude,
    this.longitude,
    this.iPv4,
    this.state,
  });

  IpDetail copyWith({
    String? countryCode,
    String? countryName,
    String? city,
    String? postal,
    String? latitude,
    String? longitude,
    String? iPv4,
    String? state,
  }) =>
      IpDetail(
        countryCode: countryCode ?? this.countryCode,
        countryName: countryName ?? this.countryName,
        city: city ?? this.city,
        postal: postal ?? this.postal,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        iPv4: iPv4 ?? this.iPv4,
        state: state ?? this.state,
      );

  factory IpDetail.fromRawJson(String str) =>
      IpDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IpDetail.fromJson(Map<String, dynamic> json) => IpDetail(
        countryCode: json["country_code"],
        countryName: json["country_name"],
        city: json["city"],
        postal: json["postal"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        iPv4: json["IPv4"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "country_name": countryName,
        "city": city,
        "postal": postal,
        "latitude": latitude,
        "longitude": longitude,
        "IPv4": iPv4,
        "state": state,
      };
}
