import 'dart:convert';

class PersonalDetailsModel {
  final bool? success;
  final PersonalResult? result;
  final String? message;

  PersonalDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  PersonalDetailsModel copyWith({
    bool? success,
    PersonalResult? result,
    String? message,
  }) =>
      PersonalDetailsModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory PersonalDetailsModel.fromRawJson(String str) =>
      PersonalDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonalDetailsModel.fromJson(Map<String, dynamic> json) =>
      PersonalDetailsModel(
        success: json["success"],
        result: json["result"] == null
            ? null
            : PersonalResult.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
        "message": message,
      };
}

class PersonalResult {
  final List<dynamic>? officeDays;
  final List<dynamic>? skills;
  final List<dynamic>? degreeLevel;
  final List<String>? sharedWith;
  final String? modifier;
  final List<dynamic>? thingsLikeToDo;
  final List<dynamic>? badHabbit;
  final List<dynamic>? programmingLanguage;
  final String? resultId;
  final String? cardTitle;
  final String? suffix;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? gender;
  final DateTime? dob;
  final String? intro;
  final String? country;
  final String? state;
  final String? city;
  final String? zipCode;
  final String? primaryEmail;
  final String? secondaryEmail;
  final String? primaryAddress;
  final String? secondaryAddress;
  final String? createdBy;
  final List<ContactShareWith>? mobile;
  final List<Social>? social;
  final List<VideoLink>? videoLink;
  final List<CertificationLink>? certificationLink;
  final String? websiteLink;
  final List<Logo>? logo;
  final List<Logo>? picture;
  final List<Logo>? video;
  final List<ContactShareWith>? contactShareWith;
  final List<dynamic>? collegeDetail;
  final List<dynamic>? projects;
  final List<dynamic>? achievements;
  final List<dynamic>? certification;
  final List<dynamic>? resume;
  final List<dynamic>? transcipt;
  final List<dynamic>? coverLetter;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final int? v;
  final String? tagLine;

  PersonalResult({
    this.officeDays,
    this.skills,
    this.degreeLevel,
    this.sharedWith,
    this.modifier,
    this.thingsLikeToDo,
    this.badHabbit,
    this.programmingLanguage,
    this.resultId,
    this.cardTitle,
    this.suffix,
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.dob,
    this.intro,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.primaryEmail,
    this.secondaryEmail,
    this.primaryAddress,
    this.secondaryAddress,
    this.createdBy,
    this.mobile,
    this.social,
    this.videoLink,
    this.certificationLink,
    this.websiteLink,
    this.logo,
    this.picture,
    this.video,
    this.contactShareWith,
    this.collegeDetail,
    this.projects,
    this.achievements,
    this.certification,
    this.resume,
    this.transcipt,
    this.coverLetter,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.v,
    this.tagLine,
  });

  PersonalResult copyWith({
    List<dynamic>? officeDays,
    List<dynamic>? skills,
    List<dynamic>? degreeLevel,
    List<String>? sharedWith,
    String? modifier,
    List<dynamic>? thingsLikeToDo,
    List<dynamic>? badHabbit,
    List<dynamic>? programmingLanguage,
    String? resultId,
    String? cardTitle,
    String? suffix,
    String? firstName,
    String? middleName,
    String? lastName,
    String? gender,
    DateTime? dob,
    String? intro,
    String? country,
    String? state,
    String? city,
    String? zipCode,
    String? primaryEmail,
    String? secondaryEmail,
    String? primaryAddress,
    String? secondaryAddress,
    String? createdBy,
    List<ContactShareWith>? mobile,
    List<Social>? social,
    List<VideoLink>? videoLink,
    List<CertificationLink>? certificationLink,
    String? websiteLink,
    List<Logo>? logo,
    List<Logo>? picture,
    List<Logo>? video,
    List<ContactShareWith>? contactShareWith,
    List<dynamic>? collegeDetail,
    List<dynamic>? projects,
    List<dynamic>? achievements,
    List<dynamic>? certification,
    List<dynamic>? resume,
    List<dynamic>? transcipt,
    List<dynamic>? coverLetter,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? v,
    String? tagLine,
  }) =>
      PersonalResult(
        officeDays: officeDays ?? this.officeDays,
        skills: skills ?? this.skills,
        degreeLevel: degreeLevel ?? this.degreeLevel,
        sharedWith: sharedWith ?? this.sharedWith,
        modifier: modifier ?? this.modifier,
        thingsLikeToDo: thingsLikeToDo ?? this.thingsLikeToDo,
        badHabbit: badHabbit ?? this.badHabbit,
        programmingLanguage: programmingLanguage ?? this.programmingLanguage,
        resultId: resultId ?? this.resultId,
        cardTitle: cardTitle ?? this.cardTitle,
        suffix: suffix ?? this.suffix,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        intro: intro ?? this.intro,
        country: country ?? this.country,
        state: state ?? this.state,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        secondaryEmail: secondaryEmail ?? this.secondaryEmail,
        primaryAddress: primaryAddress ?? this.primaryAddress,
        secondaryAddress: secondaryAddress ?? this.secondaryAddress,
        createdBy: createdBy ?? this.createdBy,
        mobile: mobile ?? this.mobile,
        social: social ?? this.social,
        videoLink: videoLink ?? this.videoLink,
        certificationLink: certificationLink ?? this.certificationLink,
        websiteLink: websiteLink ?? this.websiteLink,
        logo: logo ?? this.logo,
        picture: picture ?? this.picture,
        video: video ?? this.video,
        contactShareWith: contactShareWith ?? this.contactShareWith,
        collegeDetail: collegeDetail ?? this.collegeDetail,
        projects: projects ?? this.projects,
        achievements: achievements ?? this.achievements,
        certification: certification ?? this.certification,
        resume: resume ?? this.resume,
        transcipt: transcipt ?? this.transcipt,
        coverLetter: coverLetter ?? this.coverLetter,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        v: v ?? this.v,
        tagLine: tagLine ?? this.tagLine,
      );

  factory PersonalResult.fromRawJson(String str) =>
      PersonalResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonalResult.fromJson(Map<String, dynamic> json) => PersonalResult(
        officeDays: json["officeDays"] == null
            ? []
            : List<dynamic>.from(json["officeDays"]!.map((x) => x)),
        skills: json["skills"] == null
            ? []
            : List<dynamic>.from(json["skills"]!.map((x) => x)),
        degreeLevel: json["degreeLevel"] == null
            ? []
            : List<dynamic>.from(json["degreeLevel"]!.map((x) => x)),
        sharedWith: json["sharedWith"] == null
            ? []
            : List<String>.from(json["sharedWith"]!.map((x) => x)),
        modifier: json["modifier"],
        thingsLikeToDo: json["thingsLikeToDo"] == null
            ? []
            : List<dynamic>.from(json["thingsLikeToDo"]!.map((x) => x)),
        badHabbit: json["badHabbit"] == null
            ? []
            : List<dynamic>.from(json["badHabbit"]!.map((x) => x)),
        programmingLanguage: json["programmingLanguage"] == null
            ? []
            : List<dynamic>.from(json["programmingLanguage"]!.map((x) => x)),
        resultId: json["_id"],
        cardTitle: json["cardTitle"],
        suffix: json["suffix"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        intro: json["intro"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zipCode: json["zipCode"],
        primaryEmail: json["primaryEmail"],
        secondaryEmail: json["secondaryEmail"],
        primaryAddress: json["primaryAddress"],
        secondaryAddress: json["secondaryAddress"],
        createdBy: json["createdBy"],
        mobile: json["mobile"] == null
            ? []
            : List<ContactShareWith>.from(
                json["mobile"]!.map((x) => ContactShareWith.fromJson(x))),
        social: json["social"] == null
            ? []
            : List<Social>.from(json["social"]!.map((x) => Social.fromJson(x))),
        videoLink: json["videoLink"] == null
            ? []
            : List<VideoLink>.from(
                json["videoLink"]!.map((x) => VideoLink.fromJson(x))),
        certificationLink: json["certificationLink"] == null
            ? []
            : List<CertificationLink>.from(json["certificationLink"]!
                .map((x) => CertificationLink.fromJson(x))),
        websiteLink: json["websiteLink"],
        logo: json["logo"] == null
            ? []
            : List<Logo>.from(json["logo"]!.map((x) => Logo.fromJson(x))),
        picture: json["picture"] == null
            ? []
            : List<Logo>.from(json["picture"]!.map((x) => Logo.fromJson(x))),
        video: json["video"] == null
            ? []
            : List<Logo>.from(json["video"]!.map((x) => Logo.fromJson(x))),
        contactShareWith: json["contactShareWith"] == null
            ? []
            : List<ContactShareWith>.from(json["contactShareWith"]!
                .map((x) => ContactShareWith.fromJson(x))),
        collegeDetail: json["collegeDetail"] == null
            ? []
            : List<dynamic>.from(json["collegeDetail"]!.map((x) => x)),
        projects: json["projects"] == null
            ? []
            : List<dynamic>.from(json["projects"]!.map((x) => x)),
        achievements: json["achievements"] == null
            ? []
            : List<dynamic>.from(json["achievements"]!.map((x) => x)),
        certification: json["certification"] == null
            ? []
            : List<dynamic>.from(json["certification"]!.map((x) => x)),
        resume: json["resume"] == null
            ? []
            : List<dynamic>.from(json["resume"]!.map((x) => x)),
        transcipt: json["transcipt"] == null
            ? []
            : List<dynamic>.from(json["transcipt"]!.map((x) => x)),
        coverLetter: json["coverLetter"] == null
            ? []
            : List<dynamic>.from(json["coverLetter"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["Id"],
        v: json["__v"],
        tagLine: json["tagLine"],
      );

  Map<String, dynamic> toJson() => {
        "officeDays": officeDays == null
            ? []
            : List<dynamic>.from(officeDays!.map((x) => x)),
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "degreeLevel": degreeLevel == null
            ? []
            : List<dynamic>.from(degreeLevel!.map((x) => x)),
        "sharedWith": sharedWith == null
            ? []
            : List<dynamic>.from(sharedWith!.map((x) => x)),
        "modifier": modifier,
        "thingsLikeToDo": thingsLikeToDo == null
            ? []
            : List<dynamic>.from(thingsLikeToDo!.map((x) => x)),
        "badHabbit": badHabbit == null
            ? []
            : List<dynamic>.from(badHabbit!.map((x) => x)),
        "programmingLanguage": programmingLanguage == null
            ? []
            : List<dynamic>.from(programmingLanguage!.map((x) => x)),
        "_id": resultId,
        "cardTitle": cardTitle,
        "suffix": suffix,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "gender": gender,
        "dob": dob?.toIso8601String(),
        "intro": intro,
        "country": country,
        "state": state,
        "city": city,
        "zipCode": zipCode,
        "primaryEmail": primaryEmail,
        "secondaryEmail": secondaryEmail,
        "primaryAddress": primaryAddress,
        "secondaryAddress": secondaryAddress,
        "createdBy": createdBy,
        "mobile": mobile == null
            ? []
            : List<dynamic>.from(mobile!.map((x) => x.toJson())),
        "social": social == null
            ? []
            : List<dynamic>.from(social!.map((x) => x.toJson())),
        "videoLink": videoLink == null
            ? []
            : List<dynamic>.from(videoLink!.map((x) => x.toJson())),
        "certificationLink": certificationLink == null
            ? []
            : List<dynamic>.from(certificationLink!.map((x) => x.toJson())),
        "websiteLink": websiteLink,
        "logo": logo == null
            ? []
            : List<dynamic>.from(logo!.map((x) => x.toJson())),
        "picture": picture == null
            ? []
            : List<dynamic>.from(picture!.map((x) => x.toJson())),
        "video": video == null
            ? []
            : List<dynamic>.from(video!.map((x) => x.toJson())),
        "contactShareWith": contactShareWith == null
            ? []
            : List<dynamic>.from(contactShareWith!.map((x) => x.toJson())),
        "collegeDetail": collegeDetail == null
            ? []
            : List<dynamic>.from(collegeDetail!.map((x) => x)),
        "projects":
            projects == null ? [] : List<dynamic>.from(projects!.map((x) => x)),
        "achievements": achievements == null
            ? []
            : List<dynamic>.from(achievements!.map((x) => x)),
        "certification": certification == null
            ? []
            : List<dynamic>.from(certification!.map((x) => x)),
        "resume":
            resume == null ? [] : List<dynamic>.from(resume!.map((x) => x)),
        "transcipt": transcipt == null
            ? []
            : List<dynamic>.from(transcipt!.map((x) => x)),
        "coverLetter": coverLetter == null
            ? []
            : List<dynamic>.from(coverLetter!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Id": id,
        "__v": v,
        "tagLine": tagLine,
      };
}

class CertificationLink {
  final String? id;
  final String? title;

  CertificationLink({
    this.id,
    this.title,
  });

  CertificationLink copyWith({
    String? id,
    String? title,
  }) =>
      CertificationLink(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory CertificationLink.fromRawJson(String str) =>
      CertificationLink.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CertificationLink.fromJson(Map<String, dynamic> json) =>
      CertificationLink(
        id: json["_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
      };
}

class ContactShareWith {
  final String? id;
  final String? label;
  final String? number;
  final String? phoneCode;

  ContactShareWith({
    this.id,
    this.label,
    this.number,
    this.phoneCode,
  });

  ContactShareWith copyWith({
    String? id,
    String? label,
    String? number,
    String? phoneCode,
  }) =>
      ContactShareWith(
        id: id ?? this.id,
        label: label ?? this.label,
        number: number ?? this.number,
        phoneCode: phoneCode ?? this.phoneCode,
      );

  factory ContactShareWith.fromRawJson(String str) =>
      ContactShareWith.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactShareWith.fromJson(Map<String, dynamic> json) =>
      ContactShareWith(
        id: json["_id"],
        label: json["label"],
        number: json["number"],
        phoneCode: json["phoneCode"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "label": label,
        "number": number,
        "phoneCode": phoneCode,
      };
}

class Logo {
  final String? id;
  final String? url;
  final String? thumbUrl;
  final String? uid;
  final String? name;
  final String? status;
  final String? type;

  Logo({
    this.id,
    this.url,
    this.thumbUrl,
    this.uid,
    this.name,
    this.status,
    this.type,
  });

  Logo copyWith({
    String? id,
    String? url,
    String? thumbUrl,
    String? uid,
    String? name,
    String? status,
    String? type,
  }) =>
      Logo(
        id: id ?? this.id,
        url: url ?? this.url,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        status: status ?? this.status,
        type: type ?? this.type,
      );

  factory Logo.fromRawJson(String str) => Logo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
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

class Social {
  final String? id;
  final String? title;
  final String? label;

  Social({
    this.id,
    this.title,
    this.label,
  });

  Social copyWith({
    String? id,
    String? title,
    String? label,
  }) =>
      Social(
        id: id ?? this.id,
        title: title ?? this.title,
        label: label ?? this.label,
      );

  factory Social.fromRawJson(String str) => Social.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        id: json["_id"],
        title: json["title"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "label": label,
      };
}

class VideoLink {
  final String? id;
  final String? link;
  final String? title;

  VideoLink({
    this.id,
    this.link,
    this.title,
  });

  VideoLink copyWith({
    String? id,
    String? link,
    String? title,
  }) =>
      VideoLink(
        id: id ?? this.id,
        link: link ?? this.link,
        title: title ?? this.title,
      );

  factory VideoLink.fromRawJson(String str) =>
      VideoLink.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoLink.fromJson(Map<String, dynamic> json) => VideoLink(
        id: json["_id"],
        link: json["link"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "link": link,
        "title": title,
      };
}
