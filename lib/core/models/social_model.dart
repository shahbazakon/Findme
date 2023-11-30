import 'dart:convert';

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
