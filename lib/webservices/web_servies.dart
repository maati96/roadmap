import 'dart:convert';

import 'package:http/http.dart';
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



  Future<List<SubCateogryModel>> fromCategory() async {
    String token = await Auth().getToken();
    final response = await http.get(
      baseURL + 'categories/coding',
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

  Future<List<RoadmapModel>> fromRoadmap() async {
    String token = await Auth().getToken();

    final response = await http.get(
      baseURL + 'categories/coding/python',
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

      return roadmaps;
    } else {
      print(response.statusCode);
    }
  }
}
