import 'dart:convert';

class SearchModel {
  final bool? success;
  final List<SearchResult>? result;
  final String? message;

  SearchModel({
    this.success,
    this.result,
    this.message,
  });

  SearchModel copyWith({
    bool? success,
    List<SearchResult>? result,
    String? message,
  }) =>
      SearchModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory SearchModel.fromRawJson(String str) =>
      SearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        success: json["success"],
        result: json["result"] == null
            ? []
            : List<SearchResult>.from(
                json["result"]!.map((x) => SearchResult.fromJson(x))),
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

class SearchResult {
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
  final List<Follow>? following;
  final List<Follow>? follower;
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
  final String? tag;
  final String? userName;
  final List<dynamic>? mobileCover;
  final int? otp;

  SearchResult({
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
    this.following,
    this.follower,
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
    this.tag,
    this.userName,
    this.mobileCover,
    this.otp,
  });

  SearchResult copyWith({
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
    List<Follow>? following,
    List<Follow>? follower,
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
    String? tag,
    String? userName,
    List<dynamic>? mobileCover,
    int? otp,
  }) =>
      SearchResult(
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
        following: following ?? this.following,
        follower: follower ?? this.follower,
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
        tag: tag ?? this.tag,
        userName: userName ?? this.userName,
        mobileCover: mobileCover ?? this.mobileCover,
        otp: otp ?? this.otp,
      );

  factory SearchResult.fromRawJson(String str) =>
      SearchResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
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
        following: json["following"] == null
            ? []
            : List<Follow>.from(
                json["following"]!.map((x) => Follow.fromJson(x))),
        follower: json["follower"] == null
            ? []
            : List<Follow>.from(
                json["follower"]!.map((x) => Follow.fromJson(x))),
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
        tag: json["tag"],
        userName: json["userName"],
        mobileCover: json["mobileCover"] == null
            ? []
            : List<dynamic>.from(json["mobileCover"]!.map((x) => x)),
        otp: json["otp"],
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
        "following": following == null
            ? []
            : List<dynamic>.from(following!.map((x) => x.toJson())),
        "follower": follower == null
            ? []
            : List<dynamic>.from(follower!.map((x) => x.toJson())),
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
        "tag": tag,
        "userName": userName,
        "mobileCover": mobileCover == null
            ? []
            : List<dynamic>.from(mobileCover!.map((x) => x)),
        "otp": otp,
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

class Follow {
  final bool? status;
  final String? id;
  final String? user;
  final String? description;

  Follow({
    this.status,
    this.id,
    this.user,
    this.description,
  });

  Follow copyWith({
    bool? status,
    String? id,
    String? user,
    String? description,
  }) =>
      Follow(
        status: status ?? this.status,
        id: id ?? this.id,
        user: user ?? this.user,
        description: description ?? this.description,
      );

  factory Follow.fromRawJson(String str) => Follow.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        status: json["status"],
        id: json["_id"],
        user: json["user"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "user": user,
        "description": description,
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
