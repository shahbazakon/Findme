import 'dart:convert';

import 'package:find_me/core/models/archievement_model.dart';

class HomeModel {
  final bool? success;
  final List<HomeResult>? result;
  final String? message;

  HomeModel({
    this.success,
    this.result,
    this.message,
  });

  HomeModel copyWith({
    bool? success,
    List<HomeResult>? result,
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
            : List<HomeResult>.from(
                json["result"]!.map((x) => HomeResult.fromJson(x))),
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

class HomeResult {
  final List<dynamic>? officeDays;
  final List<String>? skills;
  final List<dynamic>? degreeLevel;
  final List<String>? sharedWith;
  final String? modifier;
  final List<String>? thingsLikeToDo;
  final List<String>? badHabbit;
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
  final String? parentPhoneCode;
  final String? specified;
  final String? specifiedBad;

  HomeResult({
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

  HomeResult copyWith({
    List<dynamic>? officeDays,
    List<String>? skills,
    List<dynamic>? degreeLevel,
    List<String>? sharedWith,
    String? modifier,
    List<String>? thingsLikeToDo,
    List<String>? badHabbit,
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
    String? parentPhoneCode,
    String? specified,
    String? specifiedBad,
  }) =>
      HomeResult(
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

  factory HomeResult.fromRawJson(String str) =>
      HomeResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeResult.fromJson(Map<String, dynamic> json) => HomeResult(
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
        modifier: json["modifier"],
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
        parentPhoneCode: json["parentPhoneCode"],
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
        "parentPhoneCode": parentPhoneCode,
        "specified": specified,
        "specifiedBad": specifiedBad,
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
