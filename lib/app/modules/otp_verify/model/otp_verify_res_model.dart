// To parse this JSON data, do
//
//     final verifyOtpResModel = verifyOtpResModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpResModel verifyOtpResModelFromJson(String str) => VerifyOtpResModel.fromJson(json.decode(str));

String verifyOtpResModelToJson(VerifyOtpResModel data) => json.encode(data.toJson());

class VerifyOtpResModel {
  String? status;
  Body? body;
  dynamic error;

  VerifyOtpResModel({
    this.status,
    this.body,
    this.error,
  });

  factory VerifyOtpResModel.fromJson(Map<String, dynamic> json) => VerifyOtpResModel(
    status: json["status"],
    body: json["body"] == null ? null : Body.fromJson(json["body"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "body": body?.toJson(),
    "error": error,
  };
}

class Body {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? city;
  dynamic email;
  String? phoneNumber;
  dynamic profilePhoto;

  Body({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.city,
    this.email,
    this.phoneNumber,
    this.profilePhoto,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    username: json["username"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    dateOfBirth: json["dateOfBirth"],
    city: json["city"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    profilePhoto: json["profilePhoto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "dateOfBirth": dateOfBirth,
    "city": city,
    "email": email,
    "phoneNumber": phoneNumber,
    "profilePhoto": profilePhoto,
  };
}
