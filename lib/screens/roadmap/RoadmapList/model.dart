// To parse this JSON data, do
//
//     final roadmapListModel = roadmapListModelFromJson(jsonString);

import 'dart:convert';

RoadmapListModel roadmapListModelFromJson(String str) =>
    RoadmapListModel.fromJson(json.decode(str));

String roadmapListModelToJson(RoadmapListModel data) =>
    json.encode(data.toJson());

class RoadmapListModel {
  RoadmapListModel({
    this.success,
    this.data,
  });

  bool success;
  List<Datum> data;

  factory RoadmapListModel.fromJson(Map<String, dynamic> json) =>
      RoadmapListModel(
        success: json["Success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.author,
    this.description,
    this.image,
    this.visitorsCount,
    this.slug,
  });

  int id;
  String name;
  Author author;
  String description;
  String image;
  int visitorsCount;
  String slug;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        author: Author.fromJson(json["author"]),
        description: json["description"],
        image: json["image"],
        visitorsCount: json["visitors_count"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "author": author.toJson(),
        "description": description,
        "image": image,
        "visitors_count": visitorsCount,
        "slug": slug,
      };
}

class Author {
  Author({
    this.username,
  });

  String username;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
