import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:roadmap/models/signup.dart';
import 'package:roadmap/models/user.dart';
import 'package:roadmap/utilities/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool authenticated = false;
  String token;
  User authenticatedUser;
  SignupModel signupUser;

  get loggedIn {
    return authenticated;
  }

  get user {
    return authenticatedUser;
  }

  Future signin({Map data, Function success, Function error}) async {
    try {
      Dio.Response response = await dio().post(
        'rest-auth/login/',
        data: json.encode(data),
      );
      String token = json.decode(response.toString())['key'];
      this.setToken(token);
      notifyListeners();
      success();
    } catch (e) {
      error();
    }
  }

  void attempt({token: ''}) async {
    if (token.toString().isNotEmpty) {
      this.token = token;
    }

    if (this.token.toString().isEmpty) {
      return;
    }

    try {
      Dio.Response response = await dio().get(
        'rest-auth/user/',
        options: Dio.Options(headers: {'Authorization': 'Token $token'}),
      );

      this.authenticated = true;
      this.authenticatedUser = User.fromJson(
        json.decode(
          response.toString(),
        ),
      );

      notifyListeners();
    } catch (e) {
      this.authenticated = false;
    }
  }

  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('key', value);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('key');
  }
}
