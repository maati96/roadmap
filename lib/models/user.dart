import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
