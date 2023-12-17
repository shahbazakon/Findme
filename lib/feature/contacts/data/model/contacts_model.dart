import 'dart:convert';

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

class Follow {
  final IpDetail? ipDetail;
  final bool? removed;
  final bool? enabled;
  final bool? isCompeletProfile;
  final bool? isAdmin;
  final String? role;
  final bool? root;
  final DateTime? createdat;
  final String? avatar;
  final String? followId;
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
  final String? country;
  final String? dob;
  final String? number;
  final String? phoneCode;
  final String? userName;
  final String? address;
  final List<dynamic>? following;
  final List<dynamic>? follower;
  final String? status;
  final int? otp;
  final String? tag;

  Follow({
    this.ipDetail,
    this.removed,
    this.enabled,
    this.isCompeletProfile,
    this.isAdmin,
    this.role,
    this.root,
    this.createdat,
    this.avatar,
    this.followId,
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
    this.country,
    this.dob,
    this.number,
    this.phoneCode,
    this.userName,
    this.address,
    this.following,
    this.follower,
    this.status,
    this.otp,
    this.tag,
  });

  Follow copyWith({
    IpDetail? ipDetail,
    bool? removed,
    bool? enabled,
    bool? isCompeletProfile,
    bool? isAdmin,
    String? role,
    bool? root,
    DateTime? createdat,
    String? avatar,
    String? followId,
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
    String? country,
    String? dob,
    String? number,
    String? phoneCode,
    String? userName,
    String? address,
    List<dynamic>? following,
    List<dynamic>? follower,
    String? status,
    int? otp,
    String? tag,
  }) =>
      Follow(
        ipDetail: ipDetail ?? this.ipDetail,
        removed: removed ?? this.removed,
        enabled: enabled ?? this.enabled,
        isCompeletProfile: isCompeletProfile ?? this.isCompeletProfile,
        isAdmin: isAdmin ?? this.isAdmin,
        role: role ?? this.role,
        root: root ?? this.root,
        createdat: createdat ?? this.createdat,
        avatar: avatar ?? this.avatar,
        followId: followId ?? this.followId,
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
        country: country ?? this.country,
        dob: dob ?? this.dob,
        number: number ?? this.number,
        phoneCode: phoneCode ?? this.phoneCode,
        userName: userName ?? this.userName,
        address: address ?? this.address,
        following: following ?? this.following,
        follower: follower ?? this.follower,
        status: status ?? this.status,
        otp: otp ?? this.otp,
        tag: tag ?? this.tag,
      );

  factory Follow.fromRawJson(String str) => Follow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
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
        followId: json["_id"],
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
        country: json["country"],
        dob: json["dob"],
        number: json["number"],
        phoneCode: json["phoneCode"],
        userName: json["userName"],
        address: json["address"],
        following: json["following"] == null
            ? []
            : List<dynamic>.from(json["following"]!.map((x) => x)),
        follower: json["follower"] == null
            ? []
            : List<dynamic>.from(json["follower"]!.map((x) => x)),
        status: json["status"],
        otp: json["otp"],
        tag: json["tag"],
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
        "_id": followId,
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
        "country": country,
        "dob": dob,
        "number": number,
        "phoneCode": phoneCode,
        "userName": userName,
        "address": address,
        "following": following == null
            ? []
            : List<dynamic>.from(following!.map((x) => x)),
        "follower":
            follower == null ? [] : List<dynamic>.from(follower!.map((x) => x)),
        "status": status,
        "otp": otp,
        "tag": tag,
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
