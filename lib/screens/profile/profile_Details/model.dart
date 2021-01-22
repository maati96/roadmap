// To parse this JSON data, do
//
//     final userDetialModel = userDetialModelFromJson(jsonString);

import 'dart:convert';

UserDetialModel userDetialModelFromJson(String str) => UserDetialModel.fromJson(json.decode(str));

String userDetialModelToJson(UserDetialModel data) => json.encode(data.toJson());

class UserDetialModel {
    UserDetialModel({
        this.pk,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
    });

    int pk;
    String username;
    String email;
    String firstName;
    String lastName;

    factory UserDetialModel.fromJson(Map<String, dynamic> json) => UserDetialModel(
        pk: json["pk"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
    };
}
