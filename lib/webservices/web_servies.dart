import 'dart:convert';

import 'package:roadmap/models/category_list.dart';
import 'package:roadmap/models/roadmap_model.dart';
import 'package:roadmap/models/sub_category_model.dart';
import 'package:http/http.dart' as http;

import 'package:roadmap/webservices/auth/auth.dart';

class WebService {
  final baseURL = 'https://roadmap-django-api.herokuapp.com/roadmap/';

  Future<List<CategoryListModel>> fromAllCategory() async {
    String token = await Auth().getToken();
    final response = await http.get(
      baseURL + 'categories',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Token $token'
      },
    );
    print("RESPONSE" + response.body);

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

  Future<List<SubCateogryModel>> fromSubCategory(String slug) async {
    print("AAAAAAAA: " + slug);
    String token = await Auth().getToken();
    final response = await http.get(
      baseURL + 'categories/$slug',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Token $token'
      },
    );

    if (response.statusCode == 200) {
      List<SubCateogryModel> subCategorys = [];
      var body = jsonDecode(response.body);
      for (var item in body) {
        subCategorys.add(SubCateogryModel.fromJson(item));
      }
      return subCategorys;
    } else {
      print(response.statusCode);
    }
  }

  Future<List<RoadmapModel>> fromRoadmap(String slug1, String slug2) async {
    String token = await Auth().getToken();

    final response = await http.get(
      baseURL + 'categories/$slug1/$slug2',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Token $token'
      },
    );

    if (response.statusCode == 200) {
      List<RoadmapModel> roadmaps = [];

      var body = jsonDecode(response.body);
      for (var roadmap in body) {
        roadmaps.add(RoadmapModel.fromJson(roadmap));
      }
      print(body);
      return roadmaps;
    } else {
      print(response.statusCode);
    }
  }

  // Future<HomeModel> getLetastCategory() async {
  //   // String token = await Auth().getToken();
  //   const String url =
  //       'https://roadmap-django-api.herokuapp.com/settings/api/home';
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     HomeModel homeModel = HomeModel.fromJson();
  //     print(response.body);

  //   } else {
  //     print(response.statusCode);
  //   }
  // 


}


