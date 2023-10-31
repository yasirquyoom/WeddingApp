import 'dart:convert';

SendOtpResModel sendOtpResModelFromJson(String str) => SendOtpResModel.fromJson(json.decode(str));

String sendOtpResModelToJson(SendOtpResModel data) => json.encode(data.toJson());

class SendOtpResModel {
  String? status;
  String? body;
  dynamic error;

  SendOtpResModel({
    this.status,
    this.body,
    this.error,
  });

  factory SendOtpResModel.fromJson(Map<String, dynamic> json) => SendOtpResModel(
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