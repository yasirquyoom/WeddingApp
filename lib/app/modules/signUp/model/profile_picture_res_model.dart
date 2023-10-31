import 'dart:convert';

ProfilePictureResModel profilePictureResModelFromJson(String str) => ProfilePictureResModel.fromJson(json.decode(str));

String profilePictureResModelToJson(ProfilePictureResModel data) => json.encode(data.toJson());

class ProfilePictureResModel {
  String? status;
  String? body;
  dynamic error;

  ProfilePictureResModel({
    this.status,
    this.body,
    this.error,
  });

  factory ProfilePictureResModel.fromJson(Map<String, dynamic> json) => ProfilePictureResModel(
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