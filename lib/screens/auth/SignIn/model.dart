// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.key,
  });

  String key;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
