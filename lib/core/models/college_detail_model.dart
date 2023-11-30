import 'dart:convert';

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
