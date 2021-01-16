// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) =>
    CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) =>
    json.encode(data.toJson());

class CategoryListModel {
  CategoryListModel({
    this.success,
    this.data,
  });

  bool success;
  List<Datum> data;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
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
    this.feeds,
  });

  Feeds feeds;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        feeds: Feeds.fromJson(json["feeds"]),
      );

  Map<String, dynamic> toJson() => {
        "feeds": feeds.toJson(),
      };
}

class Feeds {
  Feeds({
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

  factory Feeds.fromJson(Map<String, dynamic> json) => Feeds(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        slug: json["slug"],
        parent: json["parent"] == null ? null : json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "slug": slug,
        "parent": parent == null ? null : parent,
      };
}
