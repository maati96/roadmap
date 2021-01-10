// To parse this JSON data, do
//
//     final roadmapModel = roadmapModelFromJson(jsonString);

import 'dart:convert';

List<RoadmapModel> roadmapModelFromJson(String str) => List<RoadmapModel>.from(json.decode(str).map((x) => RoadmapModel.fromJson(x)));

String roadmapModelToJson(List<RoadmapModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoadmapModel {
    RoadmapModel({
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

    factory RoadmapModel.fromJson(Map<String, dynamic> json) => RoadmapModel(
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
