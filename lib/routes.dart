import 'package:flutter/material.dart';
import 'package:roadmap/models/roadmap_model.dart';
import 'package:roadmap/models/sub_category_model.dart';
import 'package:roadmap/screens/auth/login.dart';
import 'package:roadmap/screens/category/category_list.dart';
import 'package:roadmap/screens/category/category_sub_list.dart';
import 'package:roadmap/screens/roadmap/roadmap_detail.dart';
import 'package:roadmap/screens/start.dart';

import 'main.dart';

generateRoute({BuildContext context, String name, Object arguments}) {
  switch (name) {
    case '/':
      return FutureBuilder(
        future: tokenOrEmpty,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data != "") {
            var str = snapshot.data;
            var key = str.split(".");
            if (key.length != 3) {
              return StartNavigationButtom();
            } else {
              return Login();
            }
          } else {
            return Login();
          }
        },
      );
      break;
    case '/start':
      return StartNavigationButtom();
      break;
    case '/allCategory':
      return CategoryList();
      break;
    case '/categoryItems':
      return CategorySubList(
        // subCateogryModel: arguments as SubCateogryModel,
      );
      break;
    case '/allRoadmap':
      return RoadmapDetail(
          // roadmapModel: arguments as RoadmapModel,
          );
      break;
  }
}

Future<String> get tokenOrEmpty async {
  var key = await storage.read(key: "key");
  if (key == null) return "";
  return key;
}
