import 'dart:convert';

class MatrimonialDetailsModel {
  final bool? success;
  final MatrimonialDetailsResult? result;
  final String? message;

  MatrimonialDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  MatrimonialDetailsModel copyWith({
    bool? success,
    MatrimonialDetailsResult? result,
    String? message,
  }) =>
      MatrimonialDetailsModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory MatrimonialDetailsModel.fromRawJson(String str) =>
      MatrimonialDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatrimonialDetailsModel.fromJson(Map<String, dynamic> json) =>
      MatrimonialDetailsModel(
        success: json["success"],
        result: json["result"] == null
            ? null
            : MatrimonialDetailsResult.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
        "message": message,
      };
}

class MatrimonialDetailsResult {
  final List<dynamic>? officeDays;
  final List<dynamic>? skills;
  final List<dynamic>? degreeLevel;
  final List<dynamic>? sharedWith;
  final String? modifier;
  final List<String>? thingsLikeToDo;
  final List<String>? badHabbit;
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
  final String? city;
  final String? state;
  final String? zipCode;
  final String? primaryEmail;
  final String? secondaryEmail;
  final String? primaryAddress;
  final String? secondaryAddress;
  final String? occupation;
  final String? fatherOccupation;
  final String? maritalStatus;
  final String? numberOfChildren;
  final String? height;
  final String? weight;
  final String? ethnic;
  final String? languages;
  final String? religion;
  final String? caste;
  final String? sect;
  final String? prayers;
  final String? educationLevel;
  final String? contactDetail;
  final String? parentName;
  final String? parentEmail;
  final String? parentPhoneNumber;
  final String? parentPhoneCode;
  final String? createdBy;
  final List<Mobile>? mobile;
  final List<Social>? social;
  final List<VideoLink>? videoLink;
  final List<CertificationLink>? certificationLink;
  final String? websiteLink;
  final List<Logo>? logo;
  final List<Logo>? picture;
  final List<Logo>? video;
  final List<dynamic>? contactShareWith;
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
  final String? specified;
  final String? specifiedBad;
  final String? idealMatch;

  MatrimonialDetailsResult({
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
    this.city,
    this.state,
    this.zipCode,
    this.primaryEmail,
    this.secondaryEmail,
    this.primaryAddress,
    this.secondaryAddress,
    this.occupation,
    this.fatherOccupation,
    this.maritalStatus,
    this.numberOfChildren,
    this.height,
    this.weight,
    this.ethnic,
    this.languages,
    this.religion,
    this.caste,
    this.sect,
    this.prayers,
    this.educationLevel,
    this.contactDetail,
    this.parentName,
    this.parentEmail,
    this.parentPhoneNumber,
    this.parentPhoneCode,
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
    this.specified,
    this.specifiedBad,
    this.idealMatch,
  });

  MatrimonialDetailsResult copyWith({
    List<dynamic>? officeDays,
    List<dynamic>? skills,
    List<dynamic>? degreeLevel,
    List<dynamic>? sharedWith,
    String? modifier,
    List<String>? thingsLikeToDo,
    List<String>? badHabbit,
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
    String? city,
    String? state,
    String? zipCode,
    String? primaryEmail,
    String? secondaryEmail,
    String? primaryAddress,
    String? secondaryAddress,
    String? occupation,
    String? fatherOccupation,
    String? maritalStatus,
    String? numberOfChildren,
    String? height,
    String? weight,
    String? ethnic,
    String? languages,
    String? religion,
    String? caste,
    String? sect,
    String? prayers,
    String? educationLevel,
    String? contactDetail,
    String? parentName,
    String? parentEmail,
    String? parentPhoneNumber,
    String? parentPhoneCode,
    String? createdBy,
    List<Mobile>? mobile,
    List<Social>? social,
    List<VideoLink>? videoLink,
    List<CertificationLink>? certificationLink,
    String? websiteLink,
    List<Logo>? logo,
    List<Logo>? picture,
    List<Logo>? video,
    List<dynamic>? contactShareWith,
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
    String? specified,
    String? specifiedBad,
    String? idealMatch,
  }) =>
      MatrimonialDetailsResult(
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
        city: city ?? this.city,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        secondaryEmail: secondaryEmail ?? this.secondaryEmail,
        primaryAddress: primaryAddress ?? this.primaryAddress,
        secondaryAddress: secondaryAddress ?? this.secondaryAddress,
        occupation: occupation ?? this.occupation,
        fatherOccupation: fatherOccupation ?? this.fatherOccupation,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        numberOfChildren: numberOfChildren ?? this.numberOfChildren,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        ethnic: ethnic ?? this.ethnic,
        languages: languages ?? this.languages,
        religion: religion ?? this.religion,
        caste: caste ?? this.caste,
        sect: sect ?? this.sect,
        prayers: prayers ?? this.prayers,
        educationLevel: educationLevel ?? this.educationLevel,
        contactDetail: contactDetail ?? this.contactDetail,
        parentName: parentName ?? this.parentName,
        parentEmail: parentEmail ?? this.parentEmail,
        parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
        parentPhoneCode: parentPhoneCode ?? this.parentPhoneCode,
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
        specified: specified ?? this.specified,
        specifiedBad: specifiedBad ?? this.specifiedBad,
        idealMatch: idealMatch ?? this.idealMatch,
      );

  factory MatrimonialDetailsResult.fromRawJson(String str) =>
      MatrimonialDetailsResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatrimonialDetailsResult.fromJson(Map<String, dynamic> json) =>
      MatrimonialDetailsResult(
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
            : List<dynamic>.from(json["sharedWith"]!.map((x) => x)),
        modifier: json["modifier"],
        thingsLikeToDo: json["thingsLikeToDo"] == null
            ? []
            : List<String>.from(json["thingsLikeToDo"]!.map((x) => x)),
        badHabbit: json["badHabbit"] == null
            ? []
            : List<String>.from(json["badHabbit"]!.map((x) => x)),
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
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        primaryEmail: json["primaryEmail"],
        secondaryEmail: json["secondaryEmail"],
        primaryAddress: json["primaryAddress"],
        secondaryAddress: json["secondaryAddress"],
        occupation: json["occupation"],
        fatherOccupation: json["fatherOccupation"],
        maritalStatus: json["maritalStatus"],
        numberOfChildren: json["numberOfChildren"],
        height: json["height"],
        weight: json["weight"],
        ethnic: json["ethnic"],
        languages: json["languages"],
        religion: json["religion"],
        caste: json["caste"],
        sect: json["sect"],
        prayers: json["prayers"],
        educationLevel: json["educationLevel"],
        contactDetail: json["contactDetail"],
        parentName: json["parentName"],
        parentEmail: json["parentEmail"],
        parentPhoneNumber: json["parentPhoneNumber"],
        parentPhoneCode: json["parentPhoneCode"],
        createdBy: json["createdBy"],
        mobile: json["mobile"] == null
            ? []
            : List<Mobile>.from(json["mobile"]!.map((x) => Mobile.fromJson(x))),
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
            : List<dynamic>.from(json["contactShareWith"]!.map((x) => x)),
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
        specified: json["specified"],
        specifiedBad: json["specifiedBad"],
        idealMatch: json["IdealMatch"],
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
        "city": city,
        "state": state,
        "zipCode": zipCode,
        "primaryEmail": primaryEmail,
        "secondaryEmail": secondaryEmail,
        "primaryAddress": primaryAddress,
        "secondaryAddress": secondaryAddress,
        "occupation": occupation,
        "fatherOccupation": fatherOccupation,
        "maritalStatus": maritalStatus,
        "numberOfChildren": numberOfChildren,
        "height": height,
        "weight": weight,
        "ethnic": ethnic,
        "languages": languages,
        "religion": religion,
        "caste": caste,
        "sect": sect,
        "prayers": prayers,
        "educationLevel": educationLevel,
        "contactDetail": contactDetail,
        "parentName": parentName,
        "parentEmail": parentEmail,
        "parentPhoneNumber": parentPhoneNumber,
        "parentPhoneCode": parentPhoneCode,
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
        "specified": specified,
        "specifiedBad": specifiedBad,
        "IdealMatch": idealMatch,
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
