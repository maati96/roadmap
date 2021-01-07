import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        this.username,
        this.email,
        this.password1,
        this.password2,
    });

    String username;
    String email;
    String password1;
    String password2;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        username: json["username"],
        email: json["email"],
        password1: json["password1"],
        password2: json["password2"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password1": password1,
        "password2": password2,
    };
}
