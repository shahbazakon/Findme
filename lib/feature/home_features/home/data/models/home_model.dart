import 'dart:convert';

class HomeModel {
  final bool? success;
  final List<Result>? result;
  final String? message;

  HomeModel({
    this.success,
    this.result,
    this.message,
  });

  HomeModel copyWith({
    bool? success,
    List<Result>? result,
    String? message,
  }) =>
      HomeModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory HomeModel.fromRawJson(String str) =>
      HomeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json["success"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
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

class Result {
  final List<dynamic>? officeDays;
  final List<String>? skills;
  final List<dynamic>? degreeLevel;
  final List<String>? sharedWith;
  final Modifier? modifier;
  final List<String>? thingsLikeToDo;
  final List<String>? badHabbit;
  final List<String>? programmingLanguage;
  final String? resultId;
  final String? cardTitle;
  final Suffix? suffix;
  final String? firstName;
  final MiddleName? middleName;
  final LastName? lastName;
  final Gender? gender;
  final DateTime? dob;
  final String? intro;
  final Country? country;
  final State? state;
  final String? city;
  final String? zipCode;
  final PrimaryEmail? primaryEmail;
  final SecondaryEmail? secondaryEmail;
  final PrimaryAddress? primaryAddress;
  final SecondaryAddress? secondaryAddress;
  final CreatedBy? createdBy;
  final List<ContactShareWith>? mobile;
  final List<Achievement>? social;
  final List<VideoLink>? videoLink;
  final List<CertificationLink>? certificationLink;
  final String? websiteLink;
  final List<CoverLetter>? logo;
  final List<CoverLetter>? picture;
  final List<CoverLetter>? video;
  final List<ContactShareWith>? contactShareWith;
  final List<CollegeDetail>? collegeDetail;
  final List<Achievement>? projects;
  final List<Achievement>? achievements;
  final List<Achievement>? certification;
  final List<CoverLetter>? resume;
  final List<CoverLetter>? transcipt;
  final List<CoverLetter>? coverLetter;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final int? v;
  final String? workExperience;
  final String? company;
  final String? designation;
  final String? fax;
  final String? jobDescription;
  final String? companyEmail;
  final String? officeAddress;
  final DateTime? officeHourStart;
  final DateTime? officeHourEnd;
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
  final PhoneCode? parentPhoneCode;
  final String? specified;
  final String? specifiedBad;

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
    this.workExperience,
    this.company,
    this.designation,
    this.fax,
    this.jobDescription,
    this.companyEmail,
    this.officeAddress,
    this.officeHourStart,
    this.officeHourEnd,
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
    this.specified,
    this.specifiedBad,
  });

  Result copyWith({
    List<dynamic>? officeDays,
    List<String>? skills,
    List<dynamic>? degreeLevel,
    List<String>? sharedWith,
    Modifier? modifier,
    List<String>? thingsLikeToDo,
    List<String>? badHabbit,
    List<String>? programmingLanguage,
    String? resultId,
    String? cardTitle,
    Suffix? suffix,
    String? firstName,
    MiddleName? middleName,
    LastName? lastName,
    Gender? gender,
    DateTime? dob,
    String? intro,
    Country? country,
    State? state,
    String? city,
    String? zipCode,
    PrimaryEmail? primaryEmail,
    SecondaryEmail? secondaryEmail,
    PrimaryAddress? primaryAddress,
    SecondaryAddress? secondaryAddress,
    CreatedBy? createdBy,
    List<ContactShareWith>? mobile,
    List<Achievement>? social,
    List<VideoLink>? videoLink,
    List<CertificationLink>? certificationLink,
    String? websiteLink,
    List<CoverLetter>? logo,
    List<CoverLetter>? picture,
    List<CoverLetter>? video,
    List<ContactShareWith>? contactShareWith,
    List<CollegeDetail>? collegeDetail,
    List<Achievement>? projects,
    List<Achievement>? achievements,
    List<Achievement>? certification,
    List<CoverLetter>? resume,
    List<CoverLetter>? transcipt,
    List<CoverLetter>? coverLetter,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? v,
    String? workExperience,
    String? company,
    String? designation,
    String? fax,
    String? jobDescription,
    String? companyEmail,
    String? officeAddress,
    DateTime? officeHourStart,
    DateTime? officeHourEnd,
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
    PhoneCode? parentPhoneCode,
    String? specified,
    String? specifiedBad,
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
        workExperience: workExperience ?? this.workExperience,
        company: company ?? this.company,
        designation: designation ?? this.designation,
        fax: fax ?? this.fax,
        jobDescription: jobDescription ?? this.jobDescription,
        companyEmail: companyEmail ?? this.companyEmail,
        officeAddress: officeAddress ?? this.officeAddress,
        officeHourStart: officeHourStart ?? this.officeHourStart,
        officeHourEnd: officeHourEnd ?? this.officeHourEnd,
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
        specified: specified ?? this.specified,
        specifiedBad: specifiedBad ?? this.specifiedBad,
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
            : List<String>.from(json["sharedWith"]!.map((x) => x)),
        modifier: modifierValues.map[json["modifier"]]!,
        thingsLikeToDo: json["thingsLikeToDo"] == null
            ? []
            : List<String>.from(json["thingsLikeToDo"]!.map((x) => x)),
        badHabbit: json["badHabbit"] == null
            ? []
            : List<String>.from(json["badHabbit"]!.map((x) => x)),
        programmingLanguage: json["programmingLanguage"] == null
            ? []
            : List<String>.from(json["programmingLanguage"]!.map((x) => x)),
        resultId: json["_id"],
        cardTitle: json["cardTitle"],
        suffix: suffixValues.map[json["suffix"]]!,
        firstName: json["firstName"],
        middleName: middleNameValues.map[json["middleName"]]!,
        lastName: lastNameValues.map[json["lastName"]]!,
        gender: genderValues.map[json["gender"]]!,
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        intro: json["intro"],
        country: countryValues.map[json["country"]]!,
        state: stateValues.map[json["state"]]!,
        city: json["city"],
        zipCode: json["zipCode"],
        primaryEmail: primaryEmailValues.map[json["primaryEmail"]]!,
        secondaryEmail: secondaryEmailValues.map[json["secondaryEmail"]]!,
        primaryAddress: primaryAddressValues.map[json["primaryAddress"]]!,
        secondaryAddress: secondaryAddressValues.map[json["secondaryAddress"]]!,
        createdBy: createdByValues.map[json["createdBy"]]!,
        mobile: json["mobile"] == null
            ? []
            : List<ContactShareWith>.from(
                json["mobile"]!.map((x) => ContactShareWith.fromJson(x))),
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
            : List<CoverLetter>.from(
                json["logo"]!.map((x) => CoverLetter.fromJson(x))),
        picture: json["picture"] == null
            ? []
            : List<CoverLetter>.from(
                json["picture"]!.map((x) => CoverLetter.fromJson(x))),
        video: json["video"] == null
            ? []
            : List<CoverLetter>.from(
                json["video"]!.map((x) => CoverLetter.fromJson(x))),
        contactShareWith: json["contactShareWith"] == null
            ? []
            : List<ContactShareWith>.from(json["contactShareWith"]!
                .map((x) => ContactShareWith.fromJson(x))),
        collegeDetail: json["collegeDetail"] == null
            ? []
            : List<CollegeDetail>.from(
                json["collegeDetail"]!.map((x) => CollegeDetail.fromJson(x))),
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["Id"],
        v: json["__v"],
        workExperience: json["workExperience"],
        company: json["company"],
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
        parentPhoneCode: phoneCodeValues.map[json["parentPhoneCode"]]!,
        specified: json["specified"],
        specifiedBad: json["specifiedBad"],
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
        "modifier": modifierValues.reverse[modifier],
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
        "suffix": suffixValues.reverse[suffix],
        "firstName": firstName,
        "middleName": middleNameValues.reverse[middleName],
        "lastName": lastNameValues.reverse[lastName],
        "gender": genderValues.reverse[gender],
        "dob": dob?.toIso8601String(),
        "intro": intro,
        "country": countryValues.reverse[country],
        "state": stateValues.reverse[state],
        "city": city,
        "zipCode": zipCode,
        "primaryEmail": primaryEmailValues.reverse[primaryEmail],
        "secondaryEmail": secondaryEmailValues.reverse[secondaryEmail],
        "primaryAddress": primaryAddressValues.reverse[primaryAddress],
        "secondaryAddress": secondaryAddressValues.reverse[secondaryAddress],
        "createdBy": createdByValues.reverse[createdBy],
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
            : List<dynamic>.from(collegeDetail!.map((x) => x.toJson())),
        "projects": projects == null
            ? []
            : List<dynamic>.from(projects!.map((x) => x.toJson())),
        "achievements": achievements == null
            ? []
            : List<dynamic>.from(achievements!.map((x) => x.toJson())),
        "certification": certification == null
            ? []
            : List<dynamic>.from(certification!.map((x) => x.toJson())),
        "resume": resume == null
            ? []
            : List<dynamic>.from(resume!.map((x) => x.toJson())),
        "transcipt": transcipt == null
            ? []
            : List<dynamic>.from(transcipt!.map((x) => x.toJson())),
        "coverLetter": coverLetter == null
            ? []
            : List<dynamic>.from(coverLetter!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Id": id,
        "__v": v,
        "workExperience": workExperience,
        "company": company,
        "designation": designation,
        "fax": fax,
        "jobDescription": jobDescription,
        "companyEmail": companyEmail,
        "officeAddress": officeAddress,
        "officeHourStart": officeHourStart?.toIso8601String(),
        "officeHourEnd": officeHourEnd?.toIso8601String(),
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
        "parentPhoneCode": phoneCodeValues.reverse[parentPhoneCode],
        "specified": specified,
        "specifiedBad": specifiedBad,
      };
}

class Achievement {
  final String? id;
  final AchievementTitle? title;
  final String? label;
  final Detail? detail;

  Achievement({
    this.id,
    this.title,
    this.label,
    this.detail,
  });

  Achievement copyWith({
    String? id,
    AchievementTitle? title,
    String? label,
    Detail? detail,
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
        title: achievementTitleValues.map[json["title"]]!,
        label: json["label"],
        detail: detailValues.map[json["detail"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": achievementTitleValues.reverse[title],
        "label": label,
        "detail": detailValues.reverse[detail],
      };
}

enum Detail {
  CERTIFICATION_DETAILS,
  MERN_STACK_DEVELOPER_DETAILS,
  PROJECT_DETAILS_TEXTS
}

final detailValues = EnumValues({
  "certification details ": Detail.CERTIFICATION_DETAILS,
  "mern stack developer details": Detail.MERN_STACK_DEVELOPER_DETAILS,
  "project details texts": Detail.PROJECT_DETAILS_TEXTS
});

enum AchievementTitle {
  FACEBOOK,
  FINDME,
  MERN_STACK_DEVELOPER,
  MERN_STACK_DEVELOPER_CERTIFICAITON
}

final achievementTitleValues = EnumValues({
  "Facebook": AchievementTitle.FACEBOOK,
  "findme": AchievementTitle.FINDME,
  "Mern stack developer": AchievementTitle.MERN_STACK_DEVELOPER,
  "Mern stack developer certificaiton":
      AchievementTitle.MERN_STACK_DEVELOPER_CERTIFICAITON
});

class CertificationLink {
  final String? id;
  final CertificationLinkTitle? title;

  CertificationLink({
    this.id,
    this.title,
  });

  CertificationLink copyWith({
    String? id,
    CertificationLinkTitle? title,
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
        title: certificationLinkTitleValues.map[json["title"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": certificationLinkTitleValues.reverse[title],
      };
}

enum CertificationLinkTitle {
  MERN_STACK,
  MERN_STACK_DEVELOPER,
  TITLE_MERN_STACK_DEVELOPER
}

final certificationLinkTitleValues = EnumValues({
  "Mern stack ": CertificationLinkTitle.MERN_STACK,
  "Mern stack developer ": CertificationLinkTitle.MERN_STACK_DEVELOPER,
  "MERN STACK DEVELOPER": CertificationLinkTitle.TITLE_MERN_STACK_DEVELOPER
});

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

class ContactShareWith {
  final String? id;
  final Label? label;
  final String? number;
  final PhoneCode? phoneCode;

  ContactShareWith({
    this.id,
    this.label,
    this.number,
    this.phoneCode,
  });

  ContactShareWith copyWith({
    String? id,
    Label? label,
    String? number,
    PhoneCode? phoneCode,
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
        label: labelValues.map[json["label"]]!,
        number: json["number"],
        phoneCode: phoneCodeValues.map[json["phoneCode"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "label": labelValues.reverse[label],
        "number": number,
        "phoneCode": phoneCodeValues.reverse[phoneCode],
      };
}

enum Label { MOBILE }

final labelValues = EnumValues({"Mobile": Label.MOBILE});

enum PhoneCode { PHONE_CODE_PK_92, PK_92 }

final phoneCodeValues = EnumValues(
    {"PK(+92)": PhoneCode.PHONE_CODE_PK_92, "PK +92": PhoneCode.PK_92});

enum Country { PAKISTAN, UNITED_KINGDOM, UNITED_STATES }

final countryValues = EnumValues({
  "Pakistan": Country.PAKISTAN,
  "United Kingdom": Country.UNITED_KINGDOM,
  "United States": Country.UNITED_STATES
});

class CoverLetter {
  final String? id;
  final String? url;
  final String? thumbUrl;
  final String? uid;
  final String? name;
  final Status? status;
  final Type? type;

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
    Status? status,
    Type? type,
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
        status: statusValues.map[json["status"]]!,
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
        "thumbUrl": thumbUrl,
        "uid": uid,
        "name": name,
        "status": statusValues.reverse[status],
        "type": typeValues.reverse[type],
      };
}

enum Status { DONE }

final statusValues = EnumValues({"done": Status.DONE});

enum Type { APPLICATION_PDF, IMAGE_JPEG, IMAGE_PNG, VIDEO_MP4 }

final typeValues = EnumValues({
  "application/pdf": Type.APPLICATION_PDF,
  "image/jpeg": Type.IMAGE_JPEG,
  "image/png": Type.IMAGE_PNG,
  "video/mp4": Type.VIDEO_MP4
});

enum CreatedBy { THE_64_E486_F81204_ED8005072_B91 }

final createdByValues = EnumValues(
    {"64e486f81204ed8005072b91": CreatedBy.THE_64_E486_F81204_ED8005072_B91});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

enum LastName { ARIF, EMPTY, JOSAPH }

final lastNameValues = EnumValues(
    {"Arif": LastName.ARIF, "": LastName.EMPTY, "josaph": LastName.JOSAPH});

enum MiddleName { EMPTY, RANA, SMITH }

final middleNameValues = EnumValues(
    {"": MiddleName.EMPTY, "Rana": MiddleName.RANA, "smith": MiddleName.SMITH});

enum Modifier { PRIVATE, PUBLIC }

final modifierValues =
    EnumValues({"private": Modifier.PRIVATE, "public": Modifier.PUBLIC});

enum PrimaryAddress { ABC_XYZ_ADDRESS, ABC_XYZ_LAHORE, EMPTY }

final primaryAddressValues = EnumValues({
  "abc xyz address": PrimaryAddress.ABC_XYZ_ADDRESS,
  "Abc xyz Lahore ": PrimaryAddress.ABC_XYZ_LAHORE,
  "": PrimaryAddress.EMPTY
});

enum PrimaryEmail { ABCXYZ_GMAIL_COM, HARISMKT11_GMAIL_COM, XYZ_GMAIL_COM }

final primaryEmailValues = EnumValues({
  "abcxyz@gmail.com": PrimaryEmail.ABCXYZ_GMAIL_COM,
  "harismkt11@gmail.com": PrimaryEmail.HARISMKT11_GMAIL_COM,
  "xyz@gmail.com": PrimaryEmail.XYZ_GMAIL_COM
});

enum SecondaryAddress { ABC_XYZ_ADDRESS_2, ABC_XYZ_SECONDARY_ADDRESS, EMPTY }

final secondaryAddressValues = EnumValues({
  "abc xyz address 2": SecondaryAddress.ABC_XYZ_ADDRESS_2,
  "abc xyz secondary address": SecondaryAddress.ABC_XYZ_SECONDARY_ADDRESS,
  "": SecondaryAddress.EMPTY
});

enum SecondaryEmail { ABCXYZ_GMAIL_COM, EMPTY }

final secondaryEmailValues = EnumValues({
  "abcxyz@gmail.com": SecondaryEmail.ABCXYZ_GMAIL_COM,
  "": SecondaryEmail.EMPTY
});

enum State { ABC, EMPTY, PUNJAB }

final stateValues =
    EnumValues({"abc": State.ABC, "": State.EMPTY, "Punjab": State.PUNJAB});

enum Suffix { MR, MRS }

final suffixValues = EnumValues({"Mr.": Suffix.MR, "Mrs.": Suffix.MRS});

class VideoLink {
  final String? id;
  final String? link;
  final VideoLinkTitle? title;

  VideoLink({
    this.id,
    this.link,
    this.title,
  });

  VideoLink copyWith({
    String? id,
    String? link,
    VideoLinkTitle? title,
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
        title: videoLinkTitleValues.map[json["title"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "link": link,
        "title": videoLinkTitleValues.reverse[title],
      };
}

enum VideoLinkTitle { DUMMY_VIDEO_TITLE, YOU_TUBE_VIDEO }

final videoLinkTitleValues = EnumValues({
  "Dummy Video title": VideoLinkTitle.DUMMY_VIDEO_TITLE,
  "YouTube Video ": VideoLinkTitle.YOU_TUBE_VIDEO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
