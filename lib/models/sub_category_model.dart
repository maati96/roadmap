// To parse this JSON data, do
//
//     final subCateogryModel = subCateogryModelFromJson(jsonString);

import 'dart:convert';


List<SubCateogryModel> subCateogryModelFromJson(String str) =>
    List<SubCateogryModel>.from(
        json.decode(str).map((x) => SubCateogryModel.fromJson(x)));

String subCateogryModelToJson(List<SubCateogryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCateogryModel {
  SubCateogryModel({
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

  factory SubCateogryModel.fromJson(Map<String, dynamic> json) =>
      SubCateogryModel(
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
