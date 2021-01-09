// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';


List<CategoryListModel> categoryListModelFromJson(String str) =>
    List<CategoryListModel>.from(
        json.decode(str).map((x) => CategoryListModel.fromJson(x)));

String categoryListModelToJson(List<CategoryListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryListModel {
  CategoryListModel({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.parent,
  });

  int id;
  String name;
  String image;
  String slug;
  int parent;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        slug: json["slug"],
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "slug": slug,
        "parent": parent,
      };
 
  
}
