import 'dart:convert';

class BusinessPortfolioModel {
  final bool? success;
  final BusinessResult? result;
  final String? message;

  BusinessPortfolioModel({
    this.success,
    this.result,
    this.message,
  });

  BusinessPortfolioModel copyWith({
    bool? success,
    BusinessResult? result,
    String? message,
  }) =>
      BusinessPortfolioModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory BusinessPortfolioModel.fromRawJson(String str) =>
      BusinessPortfolioModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessPortfolioModel.fromJson(Map<String, dynamic> json) =>
      BusinessPortfolioModel(
        success: json["success"],
        result: json["result"] == null
            ? null
            : BusinessResult.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
        "message": message,
      };
}

class BusinessResult {
  final List<String>? officeDays;
  final List<dynamic>? skills;
  final List<dynamic>? degreeLevel;
  final List<dynamic>? sharedWith;
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
  final String? company;
  final String? city;
  final String? zipCode;
  final String? state;
  final String? country;
  final String? designation;
  final String? fax;
  final String? jobDescription;
  final String? companyEmail;
  final String? officeAddress;
  final DateTime? officeHourStart;
  final DateTime? officeHourEnd;
  final String? primaryEmail;
  final String? secondaryEmail;
  final String? primaryAddress;
  final String? secondaryAddress;
  final List<Achievement>? projects;
  final List<Achievement>? achievements;
  final List<Achievement>? certification;
  final String? createdBy;
  final List<Mobile>? mobile;
  final List<Achievement>? social;
  final List<VideoLink>? videoLink;
  final List<CertificationLink>? certificationLink;
  final String? websiteLink;
  final List<Logo>? logo;
  final List<Logo>? picture;
  final List<Logo>? video;
  final List<dynamic>? contactShareWith;
  final List<dynamic>? collegeDetail;
  final List<dynamic>? resume;
  final List<dynamic>? transcipt;
  final List<dynamic>? coverLetter;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final int? v;

  BusinessResult({
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
    this.company,
    this.city,
    this.zipCode,
    this.state,
    this.country,
    this.designation,
    this.fax,
    this.jobDescription,
    this.companyEmail,
    this.officeAddress,
    this.officeHourStart,
    this.officeHourEnd,
    this.primaryEmail,
    this.secondaryEmail,
    this.primaryAddress,
    this.secondaryAddress,
    this.projects,
    this.achievements,
    this.certification,
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
    this.resume,
    this.transcipt,
    this.coverLetter,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.v,
  });

  BusinessResult copyWith({
    List<String>? officeDays,
    List<dynamic>? skills,
    List<dynamic>? degreeLevel,
    List<dynamic>? sharedWith,
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
    String? company,
    String? city,
    String? zipCode,
    String? state,
    String? country,
    String? designation,
    String? fax,
    String? jobDescription,
    String? companyEmail,
    String? officeAddress,
    DateTime? officeHourStart,
    DateTime? officeHourEnd,
    String? primaryEmail,
    String? secondaryEmail,
    String? primaryAddress,
    String? secondaryAddress,
    List<Achievement>? projects,
    List<Achievement>? achievements,
    List<Achievement>? certification,
    String? createdBy,
    List<Mobile>? mobile,
    List<Achievement>? social,
    List<VideoLink>? videoLink,
    List<CertificationLink>? certificationLink,
    String? websiteLink,
    List<Logo>? logo,
    List<Logo>? picture,
    List<Logo>? video,
    List<dynamic>? contactShareWith,
    List<dynamic>? collegeDetail,
    List<dynamic>? resume,
    List<dynamic>? transcipt,
    List<dynamic>? coverLetter,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? v,
  }) =>
      BusinessResult(
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
        company: company ?? this.company,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        state: state ?? this.state,
        country: country ?? this.country,
        designation: designation ?? this.designation,
        fax: fax ?? this.fax,
        jobDescription: jobDescription ?? this.jobDescription,
        companyEmail: companyEmail ?? this.companyEmail,
        officeAddress: officeAddress ?? this.officeAddress,
        officeHourStart: officeHourStart ?? this.officeHourStart,
        officeHourEnd: officeHourEnd ?? this.officeHourEnd,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        secondaryEmail: secondaryEmail ?? this.secondaryEmail,
        primaryAddress: primaryAddress ?? this.primaryAddress,
        secondaryAddress: secondaryAddress ?? this.secondaryAddress,
        projects: projects ?? this.projects,
        achievements: achievements ?? this.achievements,
        certification: certification ?? this.certification,
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
        resume: resume ?? this.resume,
        transcipt: transcipt ?? this.transcipt,
        coverLetter: coverLetter ?? this.coverLetter,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory BusinessResult.fromRawJson(String str) =>
      BusinessResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessResult.fromJson(Map<String, dynamic> json) => BusinessResult(
        officeDays: json["officeDays"] == null
            ? []
            : List<String>.from(json["officeDays"]!.map((x) => x)),
        skills: json["skills"] == null
            ? []
            : List<dynamic>.from(json["skills"]!.map((x) => x)),
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
        company: json["company"],
        city: json["city"],
        zipCode: json["zipCode"],
        state: json["state"],
        country: json["country"],
        designation: json["designation"],
        fax: json["fax"],
        jobDescription: json["jobDescription"],
        companyEmail: json["companyEmail"],
        officeAddress: json["officeAddress"],
        officeHourStart: json["officeHourStart"] == null
            ? null
            : DateTime.parse(json["officeHourStart"]),
        officeHourEnd: json["officeHourEnd"] == null
            ? null
            : DateTime.parse(json["officeHourEnd"]),
        primaryEmail: json["primaryEmail"],
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
        createdBy: json["createdBy"],
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
            : List<dynamic>.from(json["contactShareWith"]!.map((x) => x)),
        collegeDetail: json["collegeDetail"] == null
            ? []
            : List<dynamic>.from(json["collegeDetail"]!.map((x) => x)),
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
        "company": company,
        "city": city,
        "zipCode": zipCode,
        "state": state,
        "country": country,
        "designation": designation,
        "fax": fax,
        "jobDescription": jobDescription,
        "companyEmail": companyEmail,
        "officeAddress": officeAddress,
        "officeHourStart": officeHourStart?.toIso8601String(),
        "officeHourEnd": officeHourEnd?.toIso8601String(),
        "primaryEmail": primaryEmail,
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
            : List<dynamic>.from(contactShareWith!.map((x) => x)),
        "collegeDetail": collegeDetail == null
            ? []
            : List<dynamic>.from(collegeDetail!.map((x) => x)),
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
