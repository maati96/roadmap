import 'dart:convert';

import 'package:http/http.dart';
import 'package:roadmap/models/roadmap_model.dart';
import 'package:roadmap/models/sub_category_model.dart';
import 'package:roadmap/utilities/auth/auth.dart';
import 'package:http/http.dart' as http;

class Resource {
  final String url;
  Function(Response response) parse;

  Resource({this.url, this.parse});
}

class WebService {
  Future load(Resource resource) async {
    String token = await Auth().getToken();
    final response = await http.get(
        'https://roadmap-django-api.herokuapp.com/roadmap/${resource.url}',
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Token $token'
        });
    print(response.body);
    print(token);
    return resource.parse(response);
  }

  Future<List<SubCateogryModel>> fromCategory() async {
    String token = await Auth().getToken();

    final response = await http.get(
      'https://roadmap-django-api.herokuapp.com/roadmap/categories/coding',
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
      'https://roadmap-django-api.herokuapp.com/roadmap/categories/coding/python',
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
