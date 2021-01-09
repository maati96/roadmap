import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:roadmap/models/signup.dart';
import 'package:roadmap/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class Auth extends ChangeNotifier {
  String token;
  User authenticatedUser;
  SignupModel signupUser;
  Status _status = Status.Uninitialized;

  Status get status => _status;
  get user {
    return authenticatedUser;
  }

  Future attemptLogIn({Map data, Function success, Function error}) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      var res = await http.post(
        "https://roadmap-django-api.herokuapp.com/rest-auth/login/",
        body: json.encode(data),
      );
      if (res.statusCode == 200) return res.body;
      success();
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
    }
  }
  // Future<String> attemptLogIn(String username, String password) async {
  //   var res = await http.post(
  //     "https://roadmap-django-api.herokuapp.com/rest-auth/login/",
  //     body: {"username": username, "password": password},
  //   );
  //   if (res.statusCode == 200) return res.body;
  //   return null;
  // }

  // Future signin({Map data, Function success, Function error}) async {
  //   try {
  //     Dio.Response response = await dio().post(
  //       'rest-auth/login/',
  //       data: json.encode(data),
  //     );
  //     String token = json.decode(response.toString())['key'];
  //     this.setToken(token);
  //     notifyListeners();
  //     success();
  //   } catch (e) {
  //    print(e.toString());
  //   }
  // }

  // Future signUp({Map data, Function success, Function error}) async {
  //   try {
  //     Dio.Response response = await dio().post(
  //       'rest-auth/signup',
  //       data: json.encode(data),
  //     );
  //     String token = json.decode(response.toString())['key'];
  //     this.setToken(token);
  //     this.attempt(token: token);
  //     notifyListeners();
  //     success();
  //   } catch (e) {
  //    print(e.toString());
  //   }
  // }

  void attempt({token: ''}) async {
    if (token.toString().isNotEmpty) {
      this.token = token;
    }

    if (this.token.toString().isEmpty) {
      return;
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
