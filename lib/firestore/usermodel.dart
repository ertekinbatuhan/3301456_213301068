import 'dart:convert';

String userToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.id,
    required this.surName,
    required this.name,
    required this.marks,
  });

  String? id;
  final String surName;
  final String name;
  final num marks;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    surName: json["surName"],
    name: json["name"],
    marks: json["point"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "surName": surName,
    "name": name,
    "point": marks,
  };
}