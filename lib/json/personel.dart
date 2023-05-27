import 'dart:convert';

Personal personalFromJson(String str) => Personal.fromJson(json.decode(str));

String personalToJson(Personal data) => json.encode(data.toJson());

class Personal {
  Personal({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Info>? data;
  Support? support;

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: List<Info>.from(json["data"].map((x) => Info.fromJson(x))),
    support: Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "support": support!.toJson(),
  };
}

class Info {
  Info({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}