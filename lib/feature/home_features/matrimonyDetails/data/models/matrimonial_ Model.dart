import 'dart:convert';

import 'package:find_me/core/models/certification_link_model.dart';
import 'package:find_me/core/models/logo_model.dart';
import 'package:find_me/core/models/mobile_model.dart';
import 'package:find_me/core/models/social_model.dart';
import 'package:find_me/core/models/video_link_model.dart';

class MatrimonialModel {
  final bool? success;
  final MatrimonialResult? result;
  final String? message;

  MatrimonialModel({
    this.success,
    this.result,
    this.message,
  });

  MatrimonialModel copyWith({
    bool? success,
    MatrimonialResult? result,
    String? message,
  }) =>
      MatrimonialModel(
        success: success ?? this.success,
        result: result ?? this.result,
        message: message ?? this.message,
      );

  factory MatrimonialModel.fromRawJson(String str) =>
      MatrimonialModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatrimonialModel.fromJson(Map<String, dynamic> json) =>
      MatrimonialModel(
        success: json["success"],
        result: json["result"] == null
            ? null
            : MatrimonialResult.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": result?.toJson(),
        "message": message,
      };
}

class MatrimonialResult {
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
  final String? primaryEmail;
  final String? gender;
  final DateTime? dob;
  final String? intro;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;
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
  final List<Mobile>? mobile;
  final List<Social>? social;
  final List<VideoLink>? videoLink;
  final List<CertificationLink>? certificationLink;
  final String? websiteLink;
  final List<Logo>? picture;
  final List<Logo>? logo;
  final List<Logo>? video;
  final String? specified;
  final String? specifiedBad;
  final String? parentName;
  final String? parentPhoneNumber;
  final String? parentEmail;
  final String? createdBy;
  final List<dynamic>? collegeDetail;
  final List<dynamic>? projects;
  final List<dynamic>? achievements;
  final List<dynamic>? certification;
  final List<dynamic>? contactShareWith;
  final List<dynamic>? resume;
  final List<dynamic>? transcipt;
  final List<dynamic>? coverLetter;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final int? v;

  MatrimonialResult({
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
    this.city,
    this.state,
    this.country,
    this.zipCode,
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
    this.mobile,
    this.social,
    this.videoLink,
    this.certificationLink,
    this.websiteLink,
    this.picture,
    this.logo,
    this.video,
    this.specified,
    this.specifiedBad,
    this.parentName,
    this.parentPhoneNumber,
    this.parentEmail,
    this.createdBy,
    this.collegeDetail,
    this.projects,
    this.achievements,
    this.certification,
    this.contactShareWith,
    this.resume,
    this.transcipt,
    this.coverLetter,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.v,
  });

  MatrimonialResult copyWith({
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
    String? primaryEmail,
    String? gender,
    DateTime? dob,
    String? intro,
    String? city,
    String? state,
    String? country,
    String? zipCode,
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
    List<Mobile>? mobile,
    List<Social>? social,
    List<VideoLink>? videoLink,
    List<CertificationLink>? certificationLink,
    String? websiteLink,
    List<Logo>? picture,
    List<Logo>? logo,
    List<Logo>? video,
    String? specified,
    String? specifiedBad,
    String? parentName,
    String? parentPhoneNumber,
    String? parentEmail,
    String? createdBy,
    List<dynamic>? collegeDetail,
    List<dynamic>? projects,
    List<dynamic>? achievements,
    List<dynamic>? certification,
    List<dynamic>? contactShareWith,
    List<dynamic>? resume,
    List<dynamic>? transcipt,
    List<dynamic>? coverLetter,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    int? v,
  }) =>
      MatrimonialResult(
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
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        zipCode: zipCode ?? this.zipCode,
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
        mobile: mobile ?? this.mobile,
        social: social ?? this.social,
        videoLink: videoLink ?? this.videoLink,
        certificationLink: certificationLink ?? this.certificationLink,
        websiteLink: websiteLink ?? this.websiteLink,
        picture: picture ?? this.picture,
        logo: logo ?? this.logo,
        video: video ?? this.video,
        specified: specified ?? this.specified,
        specifiedBad: specifiedBad ?? this.specifiedBad,
        parentName: parentName ?? this.parentName,
        parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
        parentEmail: parentEmail ?? this.parentEmail,
        createdBy: createdBy ?? this.createdBy,
        collegeDetail: collegeDetail ?? this.collegeDetail,
        projects: projects ?? this.projects,
        achievements: achievements ?? this.achievements,
        certification: certification ?? this.certification,
        contactShareWith: contactShareWith ?? this.contactShareWith,
        resume: resume ?? this.resume,
        transcipt: transcipt ?? this.transcipt,
        coverLetter: coverLetter ?? this.coverLetter,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory MatrimonialResult.fromRawJson(String str) =>
      MatrimonialResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatrimonialResult.fromJson(Map<String, dynamic> json) =>
      MatrimonialResult(
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
        primaryEmail: json["primaryEmail"],
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        intro: json["intro"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zipCode"],
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
        picture: json["picture"] == null
            ? []
            : List<Logo>.from(json["picture"]!.map((x) => Logo.fromJson(x))),
        logo: json["logo"] == null
            ? []
            : List<Logo>.from(json["logo"]!.map((x) => Logo.fromJson(x))),
        video: json["video"] == null
            ? []
            : List<Logo>.from(json["video"]!.map((x) => Logo.fromJson(x))),
        specified: json["specified"],
        specifiedBad: json["specifiedBad"],
        parentName: json["parentName"],
        parentPhoneNumber: json["parentPhoneNumber"],
        parentEmail: json["parentEmail"],
        createdBy: json["createdBy"],
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
        contactShareWith: json["contactShareWith"] == null
            ? []
            : List<dynamic>.from(json["contactShareWith"]!.map((x) => x)),
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
        "primaryEmail": primaryEmail,
        "gender": gender,
        "dob": dob?.toIso8601String(),
        "intro": intro,
        "city": city,
        "state": state,
        "country": country,
        "zipCode": zipCode,
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
        "specified": specified,
        "specifiedBad": specifiedBad,
        "parentName": parentName,
        "parentPhoneNumber": parentPhoneNumber,
        "parentEmail": parentEmail,
        "createdBy": createdBy,
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
        "contactShareWith": contactShareWith == null
            ? []
            : List<dynamic>.from(contactShareWith!.map((x) => x)),
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
