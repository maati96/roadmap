import 'dart:convert';

import 'package:roadmap/models/roadmap_model.dart';
import 'package:roadmap/models/sub_category_model.dart';
import 'package:http/http.dart' as http;
import 'package:roadmap/screens/auth/SignIn/model.dart';
import 'package:roadmap/screens/category/model.dart';
import 'package:roadmap/utilities/Shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  final baseURL = 'https://roadmap-django-api.herokuapp.com/roadmap/';

  Future<List<CategoryListModel>> fromAllCategory() async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");
    final response = await http.get(
      baseURL + 'categories',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': token
      },
    );
    // print("RESPONSE" + response.body);

    if (response.statusCode == 200) {
      List<CategoryListModel> allCategoryList = [];

      var body = jsonDecode(response.body);
      for (var item in body) {
        allCategoryList.add(CategoryListModel.fromJson(item));
      }
      return allCategoryList;
    } else {
      print(response.statusCode);
    }
  }

  Future<List<SubCateogryModel>> fromSubCategory(int id) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");
    final response = await http.get(
      baseURL + 'categories/$id',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': token
      },
    );
    print("Ressssoinse" + response.body);
    if (response.statusCode == 200) {
      List<SubCateogryModel> subCategorys = [];
      var body = jsonDecode(response.body);
      for (var item in body) {
        var _model = AuthModel.fromJson(item);
        Prefs.setBool("isAuth", true);
        Prefs.setString("token", "Token " + _model.key);
        subCategorys.add(SubCateogryModel.fromJson(item));
      }

      return subCategorys;
    } else {
      print(response.statusCode);
    }
  }

  Future<List<RoadmapModel>> fromRoadmap(String slug1, String slug2) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");

    final response = await http.get(
      baseURL + 'categories/$slug1/$slug2',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': token
      },
    );

    if (response.statusCode == 200) {
      List<RoadmapModel> roadmaps = [];

      var body = jsonDecode(response.body);
      for (var roadmap in body) {
        var _model = AuthModel.fromJson(roadmap);
        Prefs.setBool("isAuth", true);
        Prefs.setString("token", "Token " + _model.key);
        roadmaps.add(RoadmapModel.fromJson(roadmap));
      }
      print(body);
      return roadmaps;
    } else {
      print(response.statusCode);
    }
  }
}
