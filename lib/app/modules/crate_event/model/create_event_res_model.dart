import 'dart:convert';

CreateEventResModel createEventResModelFromJson(String str) => CreateEventResModel.fromJson(json.decode(str));

String createEventResModelToJson(CreateEventResModel data) => json.encode(data.toJson());

class CreateEventResModel {
  String? status;
  Body? body;
  dynamic error;

  CreateEventResModel({
    this.status,
    this.body,
    this.error,
  });

  factory CreateEventResModel.fromJson(Map<String, dynamic> json) => CreateEventResModel(
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
  String? name;
  String? description;
  DateTime? date;
  String? hostId;
  dynamic qrCode;
  dynamic coverPhotoLink;
  dynamic openToPublic;
  dynamic facePrivacy;
  dynamic guestUpload;
  int? numberOfPhotos;
  int? numberOfVideos;
  dynamic numberOfLikes;
  dynamic filePaths;
  List<Vendor>? vendors;
  dynamic userDto;

  Body({
    this.id,
    this.name,
    this.description,
    this.date,
    this.hostId,
    this.qrCode,
    this.coverPhotoLink,
    this.openToPublic,
    this.facePrivacy,
    this.guestUpload,
    this.numberOfPhotos,
    this.numberOfVideos,
    this.numberOfLikes,
    this.filePaths,
    this.vendors,
    this.userDto,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    hostId: json["hostId"],
    qrCode: json["qrCode"],
    coverPhotoLink: json["coverPhotoLink"],
    openToPublic: json["openToPublic"],
    facePrivacy: json["facePrivacy"],
    guestUpload: json["guestUpload"],
    numberOfPhotos: json["numberOfPhotos"],
    numberOfVideos: json["numberOfVideos"],
    numberOfLikes: json["numberOfLikes"],
    filePaths: json["filePaths"],
    vendors: json["vendors"] == null ? [] : List<Vendor>.from(json["vendors"]!.map((x) => Vendor.fromJson(x))),
    userDto: json["userDto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "hostId": hostId,
    "qrCode": qrCode,
    "coverPhotoLink": coverPhotoLink,
    "openToPublic": openToPublic,
    "facePrivacy": facePrivacy,
    "guestUpload": guestUpload,
    "numberOfPhotos": numberOfPhotos,
    "numberOfVideos": numberOfVideos,
    "numberOfLikes": numberOfLikes,
    "filePaths": filePaths,
    "vendors": vendors == null ? [] : List<dynamic>.from(vendors!.map((x) => x.toJson())),
    "userDto": userDto,
  };
}

class Vendor {
  String? id;
  String? category;
  String? name;
  String? website;
  String? instagram;
  String? phoneNumber;

  Vendor({
    this.id,
    this.category,
    this.name,
    this.website,
    this.instagram,
    this.phoneNumber,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    category: json["category"],
    name: json["name"],
    website: json["website"],
    instagram: json["instagram"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "name": name,
    "website": website,
    "instagram": instagram,
    "phoneNumber": phoneNumber,
  };
}
