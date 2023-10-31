import 'dart:convert';

CreateProfileResModel createProfileResModelFromJson(String str) => CreateProfileResModel.fromJson(json.decode(str));

String createProfileResModelToJson(CreateProfileResModel data) => json.encode(data.toJson());

class CreateProfileResModel {
  String? status;
  dynamic body;
  String? error;

  CreateProfileResModel({
    this.status,
    this.body,
    this.error,
  });

  factory CreateProfileResModel.fromJson(Map<String, dynamic> json) => CreateProfileResModel(
    status: json["status"],
    body: json["body"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "body": body,
    "error": error,
  };
}
