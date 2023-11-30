import 'dart:convert';

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
