//import 'package:flutter/material.dart';
//import 'package:roadmap/screens/auth/SignIn/view.dart';
//import 'package:roadmap/screens/auth/login.dart';
//import 'package:roadmap/screens/category/category_list.dart';
//import 'package:roadmap/screens/start.dart';
//import 'package:roadmap/utilities/Shared.dart';
//
//import 'main.dart';
//
//void getToken() {
//  Prefs.getStringF("token").then((value) {
//    if (value != null && value != "") {
//      return StartNavigationButtom();
//    } else {
//      return SignInView();
//    }
//  });
//}
//
////generateRoute({BuildContext context, String name, Object arguments}) {
////  switch (name) {
////    case '/':
////      return FutureBuilder(
//////        future: tokenOrEmpty,
////        builder: (context, snapshot) {
////          if (!snapshot.hasData) return CircularProgressIndicator();
////          if (snapshot.data != "") {
////            var str = snapshot.data;
////            var key = str.split(".");
////            if (key.length != 3) {
////              return StartNavigationButtom();
////            } else {
////              return SignInView();
////            }
////          } else {
////            return SignInView();
////          }
////        },
////      );
////      break;
////    case '/start':
////      return StartNavigationButtom();
////      break;
////    case '/allCategory':
////      return CategoryList();
////      break;
////  }
////}
////
////Future<String> get tokenOrEmpty async {
////  var key = await storage.read(key: "key");
////  if (key == null) return "";
////  return key;
////}
