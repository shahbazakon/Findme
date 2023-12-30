import 'dart:convert';

import 'package:find_me/core/models/cover_letter_model.dart';
import 'package:find_me/core/models/mobile_model.dart';

import '../../../../../core/models/video_link_model.dart';

class AcademicDetailsModel {
  final bool? success;
  final AcademicResult? result;
  final String? message;

  AcademicDetailsModel({
    this.success,
    this.result,
    this.message,
  });

  AcademicDetailsModel copyWith({
    bool? success,
    AcademicResult? result,
    String? message,
  }) =>
      AcademicDetailsModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory AcademicDetailsModel.fromRawJson(String str) =>
      AcademicDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcademicDetailsModel.fromJson(Map<String, dynamic> json) =>
      AcademicDetailsModel(
        success: json["success"],
        result: json["result"] == null
            ? null
            : AcademicResult.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
        "message": message,
      };
}

class AcademicResult {
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
  final String? gender;
  final DateTime? dob;
  final String? intro;
  final String? city;
  final String? zipCode;
  final String? state;
  final String? country;
  final String? workExperience;
  final String? secondaryEmail;
  final String? primaryEmail;
  final String? primaryAddress;
  final String? secondaryAddress;
  final List<Achievement>? projects;
  final List<Achievement>? achievements;
  final List<Achievement>? certification;
  final List<CollegeDetail>? collegeDetail;
  final String? createdBy;
  final List<Mobile>? mobile;
  final List<Achievement>? social;
  final List<VideoLink>? videoLink;
  final List<CertificationLink>? certificationLink;
  final String? websiteLink;
  final List<CoverLetter>? logo;
  final List<CoverLetter>? picture;
  final List<CoverLetter>? video;
  final List<dynamic>? contactShareWith;
  final List<CoverLetter>? resume;
  final List<CoverLetter>? transcipt;
  final List<CoverLetter>? coverLetter;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final int? v;

  AcademicResult({
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
    this.city,
    this.zipCode,
    this.state,
    this.country,
    this.workExperience,
    this.secondaryEmail,
    this.primaryEmail,
    this.primaryAddress,
    this.secondaryAddress,
    this.projects,
    this.achievements,
    this.certification,
    this.collegeDetail,
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
    this.resume,
    this.transcipt,
    this.coverLetter,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.v,
  });

  AcademicResult copyWith({
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
    String? gender,
    DateTime? dob,
    String? intro,
    String? city,
    String? zipCode,
    String? state,
    String? country,
    String? workExperience,
    String? secondaryEmail,
    String? primaryEmail,
    String? primaryAddress,
    String? secondaryAddress,
    List<Achievement>? projects,
    List<Achievement>? achievements,
    List<Achievement>? certification,
    List<CollegeDetail>? collegeDetail,
    String? createdBy,
    List<Mobile>? mobile,
    List<Achievement>? social,
    List<VideoLink>? videoLink,
    List<CertificationLink>? certificationLink,
    String? websiteLink,
    List<CoverLetter>? logo,
    List<CoverLetter>? picture,
    List<CoverLetter>? video,
    List<dynamic>? contactShareWith,
    List<CoverLetter>? resume,
    List<CoverLetter>? transcipt,
    List<CoverLetter>? coverLetter,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? v,
  }) =>
      AcademicResult(
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
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        state: state ?? this.state,
        country: country ?? this.country,
        workExperience: workExperience ?? this.workExperience,
        secondaryEmail: secondaryEmail ?? this.secondaryEmail,
        primaryEmail: primaryEmail ?? this.primaryEmail,
        primaryAddress: primaryAddress ?? this.primaryAddress,
        secondaryAddress: secondaryAddress ?? this.secondaryAddress,
        projects: projects ?? this.projects,
        achievements: achievements ?? this.achievements,
        certification: certification ?? this.certification,
        collegeDetail: collegeDetail ?? this.collegeDetail,
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
        resume: resume ?? this.resume,
        transcipt: transcipt ?? this.transcipt,
        coverLetter: coverLetter ?? this.coverLetter,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory AcademicResult.fromRawJson(String str) =>
      AcademicResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcademicResult.fromJson(Map<String, dynamic> json) => AcademicResult(
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
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        intro: json["intro"],
        city: json["city"],
        zipCode: json["zipCode"],
        state: json["state"],
        country: json["country"],
        workExperience: json["workExperience"],
        secondaryEmail: json["secondaryEmail"],
        primaryEmail: json["primaryEmail"],
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
        collegeDetail: json["collegeDetail"] == null
            ? []
            : List<CollegeDetail>.from(
                json["collegeDetail"]!.map((x) => CollegeDetail.fromJson(x))),
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
            : List<dynamic>.from(json["contactShareWith"]!.map((x) => x)),
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
        "gender": gender ?? "",
        "dob": dob?.toIso8601String(),
        "intro": intro,
        "city": city,
        "zipCode": zipCode,
        "state": state,
        "country": country,
        "workExperience": workExperience,
        "secondaryEmail": secondaryEmail,
        "primaryEmail": primaryEmail,
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
        "collegeDetail": collegeDetail == null
            ? []
            : List<dynamic>.from(collegeDetail!.map((x) => x.toJson())),
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
