// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    HomeModel({
        this.success,
        this.latestRoadmaps,
        this.latestCategroies,
    });

    int success;
    List<LatestRoadmap> latestRoadmaps;
    List<LatestCategroy> latestCategroies;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json["Success"],
        latestRoadmaps: List<LatestRoadmap>.from(json["Latest Roadmaps"].map((x) => LatestRoadmap.fromJson(x))),
        latestCategroies: List<LatestCategroy>.from(json["Latest Categroies"].map((x) => LatestCategroy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Success": success,
        "Latest Roadmaps": List<dynamic>.from(latestRoadmaps.map((x) => x.toJson())),
        "Latest Categroies": List<dynamic>.from(latestCategroies.map((x) => x.toJson())),
    };
}

class LatestCategroy {
    LatestCategroy({
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
    dynamic parent;

    factory LatestCategroy.fromJson(Map<String, dynamic> json) => LatestCategroy(
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

class LatestRoadmap {
    LatestRoadmap({
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

    factory LatestRoadmap.fromJson(Map<String, dynamic> json) => LatestRoadmap(
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
