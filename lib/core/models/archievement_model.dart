import 'dart:convert';

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
