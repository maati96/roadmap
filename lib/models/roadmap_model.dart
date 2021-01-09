// To parse this JSON data, do
//
// final roadmapModel = roadmapModelFromJson(jsonString);

import 'dart:convert';


List<RoadmapModel> roadmapModelFromJson(String str) => List<RoadmapModel>.from(
    json.decode(str).map((x) => RoadmapModel.fromJson(x)));

String roadmapModelToJson(List<RoadmapModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoadmapModel {
  RoadmapModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.visitorsCount,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.author,
    this.mainCategory,
    this.subCategory,
  });

  int id;
  String name;
  String description;
  String image;
  int visitorsCount;
  DateTime createdAt;
  DateTime updatedAt;
  String slug;
  int author;
  int mainCategory;
  int subCategory;

  factory RoadmapModel.fromJson(Map<String, dynamic> json) => RoadmapModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        visitorsCount: json["visitors_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        slug: json["slug"],
        author: json["author"],
        mainCategory: json["main_category"],
        subCategory: json["sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "visitors_count": visitorsCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "slug": slug,
        "author": author,
        "main_category": mainCategory,
        "sub_category": subCategory,
      };


}
