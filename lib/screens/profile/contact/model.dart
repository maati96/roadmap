// To parse this JSON data, do
//
//     final contactUsModel = contactUsModelFromJson(jsonString);

import 'dart:convert';

ContactUsModel contactUsModelFromJson(String str) => ContactUsModel.fromJson(json.decode(str));

String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUsModel {
    ContactUsModel({
        this.id,
        this.message,
        this.createdAt,
        this.sender,
    });

    int id;
    String message;
    DateTime createdAt;
    int sender;

    factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        id: json["id"],
        message: json["message"],
        createdAt: DateTime.parse(json["created_at"]),
        sender: json["sender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "created_at": createdAt.toIso8601String(),
        "sender": sender,
    };
}
