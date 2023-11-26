import 'dart:convert';

class PortfolioModel {
  final bool? success;
  final Result? result;
  final String? message;

  PortfolioModel({
    this.success,
    this.result,
    this.message,
  });

  PortfolioModel copyWith({
    bool? success,
    Result? result,
    String? message,
  }) =>
      PortfolioModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory PortfolioModel.fromRawJson(String str) =>
      PortfolioModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
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
  final List<dynamic>? officeDays;
  final List<String>? skills;
  final List<dynamic>? degreeLevel;
  final List<dynamic>? sharedWith;
  final String? modifier;
  final List<dynamic>? thingsLikeToDo;
  final List<dynamic>? badHabbit;
  final List<String>? programmingLanguage;
  final String? resultId;
  final String? cardTitle;
  final String? suffix;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? primaryEmail;
  final String? gender;
  final DateTime? dob;
  final String? intro;
  final List<CollegeDetail>? collegeDetail;
  final String? workExperience;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;
  final String? secondaryEmail;
  final String? primaryAddress;
  final String? secondaryAddress;
  final List<Achievement>? projects;
  final List<Achievement>? achievements;
  final List<Achievement>? certification;
  final List<Mobile>? mobile;
  final List<Achievement>? social;
  final List<VideoLink>? videoLink;
  final List<CertificationLink>? certificationLink;
  final String? websiteLink;
  final List<CoverLetter>? picture;
  final List<CoverLetter>? logo;
  final List<CoverLetter>? video;
  final List<CoverLetter>? resume;
  final List<CoverLetter>? transcipt;
  final List<CoverLetter>? coverLetter;
  final String? createdBy;
  final List<dynamic>? contactShareWith;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final int? v;

  Result({
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
    this.primaryEmail,
    this.gender,
    this.dob,
    this.intro,
    this.collegeDetail,
    this.workExperience,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.secondaryEmail,
    this.primaryAddress,
    this.secondaryAddress,
    this.projects,
    this.achievements,
    this.certification,
    this.mobile,
    this.social,
    this.videoLink,
    this.certificationLink,
    this.websiteLink,
    this.picture,
    this.logo,
    this.video,
    this.resume,
    this.transcipt,
    this.coverLetter,
    this.createdBy,
    this.contactShareWith,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.v,
  });

  Result copyWith({
    List<dynamic>? officeDays,
    List<String>? skills,
    List<dynamic>? degreeLevel,
    List<dynamic>? sharedWith,
    String? modifier,
    List<dynamic>? thingsLikeToDo,
    List<dynamic>? badHabbit,
    List<String>? programmingLanguage,
    String? resultId,
    String? cardTitle,
    String? suffix,
    String? firstName,
    String? middleName,
    String? lastName,
    String? primaryEmail,
    String? gender,
    DateTime? dob,
    String? intro,
    List<CollegeDetail>? collegeDetail,
    String? workExperience,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    String? secondaryEmail,
    String? primaryAddress,
    String? secondaryAddress,
    List<Achievement>? projects,
    List<Achievement>? achievements,
    List<Achievement>? certification,
    List<Mobile>? mobile,
    List<Achievement>? social,
    List<VideoLink>? videoLink,
    List<CertificationLink>? certificationLink,
    String? websiteLink,
    List<CoverLetter>? picture,
    List<CoverLetter>? logo,
    List<CoverLetter>? video,
    List<CoverLetter>? resume,
    List<CoverLetter>? transcipt,
    List<CoverLetter>? coverLetter,
    String? createdBy,
    List<dynamic>? contactShareWith,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? v,
  }) =>
      Result(
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
        primaryEmail: primaryEmail ?? this.primaryEmail,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        intro: intro ?? this.intro,
        collegeDetail: collegeDetail ?? this.collegeDetail,
        workExperience: workExperience ?? this.workExperience,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        zipCode: zipCode ?? this.zipCode,
        secondaryEmail: secondaryEmail ?? this.secondaryEmail,
        primaryAddress: primaryAddress ?? this.primaryAddress,
        secondaryAddress: secondaryAddress ?? this.secondaryAddress,
        projects: projects ?? this.projects,
        achievements: achievements ?? this.achievements,
        certification: certification ?? this.certification,
        mobile: mobile ?? this.mobile,
        social: social ?? this.social,
        videoLink: videoLink ?? this.videoLink,
        certificationLink: certificationLink ?? this.certificationLink,
        websiteLink: websiteLink ?? this.websiteLink,
        picture: picture ?? this.picture,
        logo: logo ?? this.logo,
        video: video ?? this.video,
        resume: resume ?? this.resume,
        transcipt: transcipt ?? this.transcipt,
        coverLetter: coverLetter ?? this.coverLetter,
        createdBy: createdBy ?? this.createdBy,
        contactShareWith: contactShareWith ?? this.contactShareWith,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        officeDays: json["officeDays"] == null
            ? []
            : List<dynamic>.from(json["officeDays"]!.map((x) => x)),
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
        degreeLevel: json["degreeLevel"] == null
            ? []
            : List<dynamic>.from(json["degreeLevel"]!.map((x) => x)),
        sharedWith: json["sharedWith"] == null
            ? []
            : List<dynamic>.from(json["sharedWith"]!.map((x) => x)),
        modifier: json["modifier"],
        thingsLikeToDo: json["thingsLikeToDo"] == null
            ? []
            : List<dynamic>.from(json["thingsLikeToDo"]!.map((x) => x)),
        badHabbit: json["badHabbit"] == null
            ? []
            : List<dynamic>.from(json["badHabbit"]!.map((x) => x)),
        programmingLanguage: json["programmingLanguage"] == null
            ? []
            : List<String>.from(json["programmingLanguage"]!.map((x) => x)),
        resultId: json["_id"],
        cardTitle: json["cardTitle"],
        suffix: json["suffix"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        primaryEmail: json["primaryEmail"],
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        intro: json["intro"],
        collegeDetail: json["collegeDetail"] == null
            ? []
            : List<CollegeDetail>.from(
                json["collegeDetail"]!.map((x) => CollegeDetail.fromJson(x))),
        workExperience: json["workExperience"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zipCode"],
        secondaryEmail: json["secondaryEmail"],
        primaryAddress: json["primaryAddress"],
        secondaryAddress: json["secondaryAddress"],
        projects: json["projects"] == null
            ? []
            : List<Achievement>.from(
                json["projects"]!.map((x) => Achievement.fromJson(x))),
        achievements: json["achievements"] == null
            ? []
            : List<Achievement>.from(
                json["achievements"]!.map((x) => Achievement.fromJson(x))),
        certification: json["certification"] == null
            ? []
            : List<Achievement>.from(
                json["certification"]!.map((x) => Achievement.fromJson(x))),
        mobile: json["mobile"] == null
            ? []
            : List<Mobile>.from(json["mobile"]!.map((x) => Mobile.fromJson(x))),
        social: json["social"] == null
            ? []
            : List<Achievement>.from(
                json["social"]!.map((x) => Achievement.fromJson(x))),
        videoLink: json["videoLink"] == null
            ? []
            : List<VideoLink>.from(
                json["videoLink"]!.map((x) => VideoLink.fromJson(x))),
        certificationLink: json["certificationLink"] == null
            ? []
            : List<CertificationLink>.from(json["certificationLink"]!
                .map((x) => CertificationLink.fromJson(x))),
        websiteLink: json["websiteLink"],
        picture: json["picture"] == null
            ? []
            : List<CoverLetter>.from(
                json["picture"]!.map((x) => CoverLetter.fromJson(x))),
        logo: json["logo"] == null
            ? []
            : List<CoverLetter>.from(
                json["logo"]!.map((x) => CoverLetter.fromJson(x))),
        video: json["video"] == null
            ? []
            : List<CoverLetter>.from(
                json["video"]!.map((x) => CoverLetter.fromJson(x))),
        resume: json["resume"] == null
            ? []
            : List<CoverLetter>.from(
                json["resume"]!.map((x) => CoverLetter.fromJson(x))),
        transcipt: json["transcipt"] == null
            ? []
            : List<CoverLetter>.from(
                json["transcipt"]!.map((x) => CoverLetter.fromJson(x))),
        coverLetter: json["coverLetter"] == null
            ? []
            : List<CoverLetter>.from(
                json["coverLetter"]!.map((x) => CoverLetter.fromJson(x))),
        createdBy: json["createdBy"],
        contactShareWith: json["contactShareWith"] == null
            ? []
            : List<dynamic>.from(json["contactShareWith"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["Id"],
        v: json["__v"],
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
        "primaryEmail": primaryEmail,
        "gender": gender,
        "dob": dob?.toIso8601String(),
        "intro": intro,
        "collegeDetail": collegeDetail == null
            ? []
            : List<dynamic>.from(collegeDetail!.map((x) => x.toJson())),
        "workExperience": workExperience,
        "city": city,
        "state": state,
        "country": country,
        "zipCode": zipCode,
        "secondaryEmail": secondaryEmail,
        "primaryAddress": primaryAddress,
        "secondaryAddress": secondaryAddress,
        "projects": projects == null
            ? []
            : List<dynamic>.from(projects!.map((x) => x.toJson())),
        "achievements": achievements == null
            ? []
            : List<dynamic>.from(achievements!.map((x) => x.toJson())),
        "certification": certification == null
            ? []
            : List<dynamic>.from(certification!.map((x) => x.toJson())),
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
        "picture": picture == null
            ? []
            : List<dynamic>.from(picture!.map((x) => x.toJson())),
        "logo": logo == null
            ? []
            : List<dynamic>.from(logo!.map((x) => x.toJson())),
        "video": video == null
            ? []
            : List<dynamic>.from(video!.map((x) => x.toJson())),
        "resume": resume == null
            ? []
            : List<dynamic>.from(resume!.map((x) => x.toJson())),
        "transcipt": transcipt == null
            ? []
            : List<dynamic>.from(transcipt!.map((x) => x.toJson())),
        "coverLetter": coverLetter == null
            ? []
            : List<dynamic>.from(coverLetter!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "contactShareWith": contactShareWith == null
            ? []
            : List<dynamic>.from(contactShareWith!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Id": id,
        "__v": v,
      };
}

class Achievement {
  final String? id;
  final String? title;
  final String? label;
  final String? detail;

  Achievement({
    this.id,
    this.title,
    this.label,
    this.detail,
  });

  Achievement copyWith({
    String? id,
    String? title,
    String? label,
    String? detail,
  }) =>
      Achievement(
        id: id ?? this.id,
        title: title ?? this.title,
        label: label ?? this.label,
        detail: detail ?? this.detail,
      );

  factory Achievement.fromRawJson(String str) =>
      Achievement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        id: json["_id"],
        title: json["title"],
        label: json["label"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "label": label,
        "detail": detail,
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

class CollegeDetail {
  final String? id;
  final String? collegeName;
  final String? collegeAddress;
  final String? collegeEmail;
  final String? degreeLevel;
  final DateTime? degreeEnd;
  final DateTime? degreeStart;

  CollegeDetail({
    this.id,
    this.collegeName,
    this.collegeAddress,
    this.collegeEmail,
    this.degreeLevel,
    this.degreeEnd,
    this.degreeStart,
  });

  CollegeDetail copyWith({
    String? id,
    String? collegeName,
    String? collegeAddress,
    String? collegeEmail,
    String? degreeLevel,
    DateTime? degreeEnd,
    DateTime? degreeStart,
  }) =>
      CollegeDetail(
        id: id ?? this.id,
        collegeName: collegeName ?? this.collegeName,
        collegeAddress: collegeAddress ?? this.collegeAddress,
        collegeEmail: collegeEmail ?? this.collegeEmail,
        degreeLevel: degreeLevel ?? this.degreeLevel,
        degreeEnd: degreeEnd ?? this.degreeEnd,
        degreeStart: degreeStart ?? this.degreeStart,
      );

  factory CollegeDetail.fromRawJson(String str) =>
      CollegeDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CollegeDetail.fromJson(Map<String, dynamic> json) => CollegeDetail(
        id: json["_id"],
        collegeName: json["collegeName"],
        collegeAddress: json["collegeAddress"],
        collegeEmail: json["collegeEmail"],
        degreeLevel: json["degreeLevel"],
        degreeEnd: json["degreeEnd"] == null
            ? null
            : DateTime.parse(json["degreeEnd"]),
        degreeStart: json["degreeStart"] == null
            ? null
            : DateTime.parse(json["degreeStart"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "collegeName": collegeName,
        "collegeAddress": collegeAddress,
        "collegeEmail": collegeEmail,
        "degreeLevel": degreeLevel,
        "degreeEnd": degreeEnd?.toIso8601String(),
        "degreeStart": degreeStart?.toIso8601String(),
      };
}

class CoverLetter {
  final String? id;
  final String? url;
  final String? thumbUrl;
  final String? uid;
  final String? name;
  final String? status;
  final String? type;

  CoverLetter({
    this.id,
    this.url,
    this.thumbUrl,
    this.uid,
    this.name,
    this.status,
    this.type,
  });

  CoverLetter copyWith({
    String? id,
    String? url,
    String? thumbUrl,
    String? uid,
    String? name,
    String? status,
    String? type,
  }) =>
      CoverLetter(
        id: id ?? this.id,
        url: url ?? this.url,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        status: status ?? this.status,
        type: type ?? this.type,
      );

  factory CoverLetter.fromRawJson(String str) =>
      CoverLetter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoverLetter.fromJson(Map<String, dynamic> json) => CoverLetter(
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

class Mobile {
  final String? id;
  final String? label;
  final String? number;
  final String? phoneCode;

  Mobile({
    this.id,
    this.label,
    this.number,
    this.phoneCode,
  });

  Mobile copyWith({
    String? id,
    String? label,
    String? number,
    String? phoneCode,
  }) =>
      Mobile(
        id: id ?? this.id,
        label: label ?? this.label,
        number: number ?? this.number,
        phoneCode: phoneCode ?? this.phoneCode,
      );

  factory Mobile.fromRawJson(String str) => Mobile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
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
